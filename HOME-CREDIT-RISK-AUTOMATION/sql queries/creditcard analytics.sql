CREATE TABLE analytics.credit_card_features AS

SELECT
pa."SK_ID_CURR",

COUNT(DISTINCT cc."SK_ID_PREV") AS credit_card_count,

AVG(cc."AMT_BALANCE") AS avg_credit_card_balance,

MAX(cc."AMT_BALANCE") AS max_credit_card_balance,

AVG(cc."AMT_CREDIT_LIMIT_ACTUAL") AS avg_credit_limit,

AVG(cc."AMT_BALANCE" / NULLIF(cc."AMT_CREDIT_LIMIT_ACTUAL",0)) AS avg_credit_utilization,

MAX(cc."AMT_BALANCE" / NULLIF(cc."AMT_CREDIT_LIMIT_ACTUAL",0)) AS max_credit_utilization,

AVG(cc."AMT_DRAWINGS_ATM_CURRENT") AS avg_atm_withdrawal,

AVG(cc."AMT_PAYMENT_CURRENT") AS avg_monthly_payment,

AVG(cc."CNT_DRAWINGS_CURRENT") AS avg_drawings_count

FROM credit_card_balance cc

JOIN previous_application pa
ON cc."SK_ID_PREV" = pa."SK_ID_PREV"

GROUP BY pa."SK_ID_CURR";