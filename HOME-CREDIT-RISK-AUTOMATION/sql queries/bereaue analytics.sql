CREATE TABLE analytics.bureau_features AS

SELECT
br."SK_ID_CURR",

COUNT(br."SK_ID_BUREAU") AS "bureau_total_loans",

SUM(CASE WHEN br."CREDIT_ACTIVE"='Active' THEN 1 ELSE 0 END) AS bureau_active_loans,

SUM(CASE WHEN br."CREDIT_ACTIVE"='Closed' THEN 1 ELSE 0 END) AS bureau_closed_loans,

SUM(br."AMT_CREDIT_SUM") AS bureau_total_credit_sum,

SUM(br."AMT_CREDIT_SUM_DEBT") AS bureau_total_debt_sum,

SUM(br."AMT_CREDIT_SUM_OVERDUE") AS bureau_total_overdue_sum,

AVG(br."DAYS_CREDIT") AS bureau_avg_days_credit,

MAX(br."DAYS_CREDIT") AS bureau_max_days_credit,

AVG(br."CREDIT_DAY_OVERDUE") AS bureau_avg_overdue_days,

MAX(br."CREDIT_DAY_OVERDUE") AS bureau_max_overdue_days,

(SUM(br."AMT_CREDIT_SUM_DEBT") /
NULLIF(SUM(br."AMT_CREDIT_SUM"),0)) AS bureau_debt_credit_ratio

FROM bureau br

GROUP BY br."SK_ID_CURR";