CREATE TABLE "home_credit_360" AS

SELECT
a."SK_ID_CURR" AS "sk_id_curr",
a."TARGET" AS "target",

-- DEMOGRAPHICS
a."CNT_CHILDREN",
a."CNT_FAM_MEMBERS",
a."CODE_GENDER",
a."NAME_FAMILY_STATUS",
a."NAME_EDUCATION_TYPE",
a."NAME_INCOME_TYPE",

-- FINANCIAL
a."AMT_INCOME_TOTAL",
a."AMT_CREDIT",
a."AMT_ANNUITY",
a."AMT_GOODS_PRICE",

-- AGE
a."DAYS_BIRTH",
a."DAYS_EMPLOYED",
a."DAYS_REGISTRATION",
a."DAYS_ID_PUBLISH",

-- EXTERNAL SCORES
a."EXT_SOURCE_1",
a."EXT_SOURCE_2",
a."EXT_SOURCE_3",

-- BUREAU
b."bureau_total_loans",
b."bureau_active_loans",
b."bureau_closed_loans",
b."bureau_total_credit_sum",
b."bureau_total_debt_sum",
b."bureau_total_overdue_sum",
b."bureau_avg_days_credit",
b."bureau_max_days_credit",
b."bureau_avg_overdue_days",
b."bureau_max_overdue_days",

-- CREDIT CARD
cc."credit_card_count",
cc."avg_credit_card_balance",
cc."max_credit_card_balance",
cc."avg_credit_limit",
cc."avg_credit_utilization",
cc."max_credit_utilization",
cc."avg_atm_withdrawal",
cc."avg_monthly_payment",
cc."avg_drawings_count",

-- INSTALLMENTS
ins."total_installments",
ins."avg_installment_amount",
ins."avg_payment_amount",
ins."late_payment_count",
ins."on_time_payment_count",
ins."avg_payment_delay",
ins."max_payment_delay",
ins."total_payment_amount",

-- PREVIOUS APPLICATION
pa."prev_application_count",
pa."prev_approved_count",
pa."prev_refused_count",
pa."avg_prev_application_amount",
pa."avg_prev_credit_amount",
pa."avg_prev_interest_rate",

-- POS CASH
pos."pos_cash_loan_count",
pos."avg_dpd",
pos."max_dpd",
pos."avg_dpd_def",
pos."max_dpd_def",
pos."pos_overdue_count",

-- ENGINEERED FEATURES
(a."AMT_INCOME_TOTAL" / NULLIF(a."AMT_CREDIT",0)) AS "income_credit_ratio",

(a."AMT_ANNUITY" / NULLIF(a."AMT_INCOME_TOTAL",0)) AS "annuity_income_ratio",

(b."bureau_total_debt_sum" / NULLIF(b."bureau_total_credit_sum",0)) AS "bureau_debt_credit_ratio",

(ins."late_payment_count" AS FLOAT) / NULLIF(ins."total_installments", 0) AS "late_payment_ratio"

cc."avg_credit_utilization" AS "credit_utilization_ratio"

FROM "application_train" a

------------------------------------------------
-- BUREAU
------------------------------------------------

LEFT JOIN (

SELECT
"SK_ID_CURR",

COUNT("SK_ID_BUREAU") AS "bureau_total_loans",

SUM(CASE WHEN "CREDIT_ACTIVE"='Active' THEN 1 ELSE 0 END) AS "bureau_active_loans",

SUM(CASE WHEN "CREDIT_ACTIVE"='Closed' THEN 1 ELSE 0 END) AS "bureau_closed_loans",

SUM("AMT_CREDIT_SUM") AS "bureau_total_credit_sum",

SUM("AMT_CREDIT_SUM_DEBT") AS "bureau_total_debt_sum",

SUM("AMT_CREDIT_SUM_OVERDUE") AS "bureau_total_overdue_sum",

AVG("DAYS_CREDIT") AS "bureau_avg_days_credit",

MAX("DAYS_CREDIT") AS "bureau_max_days_credit",

AVG("CREDIT_DAY_OVERDUE") AS "bureau_avg_overdue_days",

MAX("CREDIT_DAY_OVERDUE") AS "bureau_max_overdue_days"

FROM "bureau"

GROUP BY "SK_ID_CURR"

) b

ON a."SK_ID_CURR" = b."SK_ID_CURR"

------------------------------------------------
-- CREDIT CARD
------------------------------------------------

LEFT JOIN (

SELECT
pa."SK_ID_CURR",

COUNT(DISTINCT cc."SK_ID_PREV") AS "credit_card_count",

AVG(cc."AMT_BALANCE") AS "avg_credit_card_balance",

MAX(cc."AMT_BALANCE") AS "max_credit_card_balance",

AVG(cc."AMT_CREDIT_LIMIT_ACTUAL") AS "avg_credit_limit",

AVG(cc."AMT_BALANCE" / NULLIF(cc."AMT_CREDIT_LIMIT_ACTUAL",0)) AS "avg_credit_utilization",

MAX(cc."AMT_BALANCE" / NULLIF(cc."AMT_CREDIT_LIMIT_ACTUAL",0)) AS "max_credit_utilization",

AVG(cc."AMT_DRAWINGS_ATM_CURRENT") AS "avg_atm_withdrawal",

AVG(cc."AMT_PAYMENT_CURRENT") AS "avg_monthly_payment",

AVG(cc."CNT_DRAWINGS_CURRENT") AS "avg_drawings_count"

FROM "credit_card_balance" cc

JOIN "previous_application" pa
ON cc."SK_ID_PREV" = pa."SK_ID_PREV"

GROUP BY pa."SK_ID_CURR"

) cc

ON a."SK_ID_CURR" = cc."SK_ID_CURR"

------------------------------------------------
-- INSTALLMENTS
------------------------------------------------

LEFT JOIN (

SELECT
pa."SK_ID_CURR",

COUNT(*) AS "total_installments",

AVG(ip."AMT_INSTALMENT") AS "avg_installment_amount",

AVG(ip."AMT_PAYMENT") AS "avg_payment_amount",

SUM(CASE WHEN ip."DAYS_ENTRY_PAYMENT" > ip."DAYS_INSTALMENT" THEN 1 ELSE 0 END) AS "late_payment_count",

SUM(CASE WHEN ip."DAYS_ENTRY_PAYMENT" <= ip."DAYS_INSTALMENT" THEN 1 ELSE 0 END) AS "on_time_payment_count",

AVG(ip."DAYS_ENTRY_PAYMENT" - ip."DAYS_INSTALMENT") AS "avg_payment_delay",

MAX(ip."DAYS_ENTRY_PAYMENT" - ip."DAYS_INSTALMENT") AS "max_payment_delay",

SUM(ip."AMT_PAYMENT") AS "total_payment_amount"

FROM "installments_payments" ip

JOIN "previous_application" pa
ON ip."SK_ID_PREV" = pa."SK_ID_PREV"

GROUP BY pa."SK_ID_CURR"

) ins

ON a."SK_ID_CURR" = ins."SK_ID_CURR"

------------------------------------------------
-- PREVIOUS APPLICATION
------------------------------------------------

LEFT JOIN (

SELECT

"SK_ID_CURR",

COUNT(*) AS "prev_application_count",

SUM(CASE WHEN "NAME_CONTRACT_STATUS"='Approved' THEN 1 ELSE 0 END) AS "prev_approved_count",

SUM(CASE WHEN "NAME_CONTRACT_STATUS"='Refused' THEN 1 ELSE 0 END) AS "prev_refused_count",

AVG("AMT_APPLICATION") AS "avg_prev_application_amount",

AVG("AMT_CREDIT") AS "avg_prev_credit_amount",

AVG("RATE_INTEREST_PRIMARY") AS "avg_prev_interest_rate"

FROM "previous_application"

GROUP BY "SK_ID_CURR"

) pa

ON a."SK_ID_CURR" = pa."SK_ID_CURR"


