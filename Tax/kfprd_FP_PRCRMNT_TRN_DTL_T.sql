SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/kfimp.xls

select * from kulowner.FP_PRCRMNT_TRN_DTL_T@uazkfprd
order by FDOC_NBR,OBJ_ID,TRN_REF_NBR asc;



spool off

