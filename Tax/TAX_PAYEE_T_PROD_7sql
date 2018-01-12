set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/TAX_PAYEE_T_7.csv

select * from tax_payee_t order by payee_id , VNDR_HDR_GNRTD_ID asc;

spool off
