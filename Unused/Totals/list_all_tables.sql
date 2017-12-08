-- Return list of all tables
set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;
select table_name from user_tables order by table_name;
