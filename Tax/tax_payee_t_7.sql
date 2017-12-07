set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 
spool ./data/tax_payee_t_7.xls

select count(1) from KULOWNER.tax_payee_t;
select * from KULOWNER.tax_payee_t order by payee_id , VNDR_HDR_GNRTD_ID asc;
