SELECT
COUNT(*) AS total_rows,
COUNT("EXT_SOURCE_1") AS non_null_ext_source_1,
COUNT("EXT_SOURCE_2") AS non_null_ext_source_2,
COUNT("EXT_SOURCE_3") AS non_null_ext_source_3
FROM application_train;