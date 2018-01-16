set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/PUR_VNDR_HDR_T_3.csv

select count(*) from PUR_VNDR_HDR_T;



spool off

spool ./data/PUR_VNDR_HDR_T_7.csv

select count(*) from PUR_VNDR_HDR_T@DBLINK;



spool off