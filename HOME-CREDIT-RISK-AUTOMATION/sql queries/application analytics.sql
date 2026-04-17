CREATE TABLE analytics.application_features AS

SELECT
"SK_ID_CURR",
"TARGET",

-- demographics
"CNT_CHILDREN",
"CNT_FAM_MEMBERS",
"CODE_GENDER",
"NAME_FAMILY_STATUS",
"NAME_EDUCATION_TYPE",
"NAME_INCOME_TYPE",

-- financial
"AMT_INCOME_TOTAL",
"AMT_CREDIT",
"AMT_ANNUITY",
"AMT_GOODS_PRICE",

-- age
"DAYS_BIRTH",
"DAYS_EMPLOYED",
"DAYS_REGISTRATION",
"DAYS_ID_PUBLISH",

-- external scores
"EXT_SOURCE_1",
"EXT_SOURCE_2",
"EXT_SOURCE_3",

-- engineered
("AMT_INCOME_TOTAL" / NULLIF("AMT_CREDIT",0)) AS income_credit_ratio,
("AMT_ANNUITY" / NULLIF("AMT_INCOME_TOTAL",0)) AS annuity_income_ratio

FROM application_train;