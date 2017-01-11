-- ====================================================================================================================
-- 0)Pre-requisites  Clean all 

-- ====================================================================================================================

-- Basic query
select DOC_TYP_ID from KREW_DOC_TYP_T;

 select table_name from all_tables where table_name like '%$%';
 select count(table_name) from all_tables where table_name like '%$%';
