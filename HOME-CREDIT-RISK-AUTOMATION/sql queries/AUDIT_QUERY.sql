SELECT
COUNT(DISTINCT a."SK_ID_CURR") AS total_customers,

COUNT(DISTINCT b."SK_ID_CURR") AS customers_with_bureau,
COUNT(DISTINCT cc."SK_ID_CURR") AS customers_with_credit_card,
COUNT(DISTINCT i."SK_ID_CURR") AS customers_with_installments,
COUNT(DISTINCT p."SK_ID_CURR") AS customers_with_previous_applications,
COUNT(DISTINCT pos."SK_ID_CURR") AS customers_with_pos_loans,

COUNT(DISTINCT a."SK_ID_CURR") - COUNT(DISTINCT b."SK_ID_CURR") AS missing_bureau_records,
COUNT(DISTINCT a."SK_ID_CURR") - COUNT(DISTINCT cc."SK_ID_CURR") AS missing_credit_card_records,
COUNT(DISTINCT a."SK_ID_CURR") - COUNT(DISTINCT i."SK_ID_CURR") AS missing_installment_records,
COUNT(DISTINCT a."SK_ID_CURR") - COUNT(DISTINCT p."SK_ID_CURR") AS missing_previous_application_records,
COUNT(DISTINCT a."SK_ID_CURR") - COUNT(DISTINCT pos."SK_ID_CURR") AS missing_pos_records

FROM application_train a

LEFT JOIN bureau b
ON a."SK_ID_CURR" = b."SK_ID_CURR"

LEFT JOIN credit_card_balance cc
ON a."SK_ID_CURR" = cc."SK_ID_CURR"

LEFT JOIN installments_payments i
ON a."SK_ID_CURR" = i."SK_ID_CURR"

LEFT JOIN previous_application p
ON a."SK_ID_CURR" = p."SK_ID_CURR"

LEFT JOIN pos_cash_balance pos
ON a."SK_ID_CURR" = pos."SK_ID_CURR";