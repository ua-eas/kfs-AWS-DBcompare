
SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 
spool ./data/kfimp.xls

select count(1) from kulowner.GL_ENTRY_T;
select * from KULOWNER.tax_payee_t order by payee_id , VNDR_HDR_GNRTD_ID asc;
