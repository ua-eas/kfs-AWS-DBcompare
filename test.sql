et colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     
set numwidth 20


spool ./data/gl_balance_t_3.csv

select * from  GL_BALANCE_T;

spool off




spool ./data/gl_balance_t_7.csv

select * from  GL_BALANCE_T@KFS7VAL

spool off