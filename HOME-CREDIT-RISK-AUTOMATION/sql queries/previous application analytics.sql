CREATE TABLE analytics.previous_application_features AS

SELECT
pa."SK_ID_CURR",

COUNT(*) AS "prev_application_count",

SUM(CASE WHEN pa."NAME_CONTRACT_STATUS"='Approved' THEN 1 ELSE 0 END) AS prev_approved_count,

SUM(CASE WHEN pa."NAME_CONTRACT_STATUS"='Refused' THEN 1 ELSE 0 END) AS prev_refused_count,

AVG(pa."AMT_APPLICATION") AS avg_prev_application_amount,

AVG(pa."AMT_CREDIT") AS avg_prev_credit_amount,

AVG(pa."RATE_INTEREST_PRIMARY") AS avg_prev_interest_rate

FROM previous_application pa

GROUP BY pa."SK_ID_CURR";