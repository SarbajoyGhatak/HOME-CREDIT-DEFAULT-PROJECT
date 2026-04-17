CREATE TABLE analytics.installment_features AS

SELECT
pa."SK_ID_CURR",

COUNT(*) AS total_installments,

AVG(ip."AMT_INSTALMENT") AS avg_installment_amount,

AVG(ip."AMT_PAYMENT") AS avg_payment_amount,

SUM(CASE WHEN ip."DAYS_ENTRY_PAYMENT" > ip."DAYS_INSTALMENT" THEN 1 ELSE 0 END) AS late_payment_count,

SUM(CASE WHEN ip."DAYS_ENTRY_PAYMENT" <= ip."DAYS_INSTALMENT" THEN 1 ELSE 0 END) AS on_time_payment_count,

AVG(ip."DAYS_ENTRY_PAYMENT" - ip."DAYS_INSTALMENT") AS avg_payment_delay,

MAX(ip."DAYS_ENTRY_PAYMENT" - ip."DAYS_INSTALMENT") AS max_payment_delay,

SUM(ip."AMT_PAYMENT") AS total_payment_amount,

SUM(CASE WHEN ip."DAYS_ENTRY_PAYMENT" > ip."DAYS_INSTALMENT" THEN 1 ELSE 0 END)
/ NULLIF(COUNT(*),0) AS late_payment_ratio

FROM installments_payments ip

JOIN previous_application pa
ON ip."SK_ID_PREV" = pa."SK_ID_PREV"

GROUP BY pa."SK_ID_CURR";