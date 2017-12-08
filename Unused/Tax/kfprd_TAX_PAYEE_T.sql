set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/kfprd.xls
select count(1) from KULOWNER.tax_payee_t@uazkfprd;
select * from KULOWNER.tax_payee_t@uazkfprd  order by payee_id , VNDR_HDR_GNRTD_ID asc;
