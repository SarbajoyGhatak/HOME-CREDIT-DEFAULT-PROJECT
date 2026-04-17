CREATE TABLE analytics.pos_cash_features AS

SELECT
pa."SK_ID_CURR",

COUNT(*) AS pos_cash_loan_count,

AVG(pos."SK_DPD") AS avg_dpd,

MAX(pos."SK_DPD") AS max_dpd,

AVG(pos."SK_DPD_DEF") AS avg_dpd_def,

MAX(pos."SK_DPD_DEF") AS max_dpd_def,

SUM(CASE WHEN pos."SK_DPD" > 0 THEN 1 ELSE 0 END) AS pos_overdue_count

FROM pos_cash_balance pos

JOIN previous_application pa
ON pos."SK_ID_PREV" = pa."SK_ID_PREV"

GROUP BY pa."SK_ID_CURR";