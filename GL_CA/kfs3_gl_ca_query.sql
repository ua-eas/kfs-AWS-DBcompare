set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/GL_CA_3.xls

select /*+ parallel(a) parallel(b) */
a.account_nbr || a.fin_object_cd || a.fin_sub_obj_cd as SUB_OBJ_CD_NOT_IN_2016,
a.univ_fiscal_yr,
a.fin_coa_cd,
a.account_nbr,
a.fin_object_cd,
a.fin_sub_obj_cd,
b.sub_fund_grp_cd,
b.acct_closed_ind,
a.fin_balance_typ_cd,
sum(a.acln_annl_bal_amt)
from gl_balance_t a
inner join ca_account_t b on a.account_nbr = b.account_nbr
where exists (
select 1
from ca_sub_object_cd_t
where univ_fiscal_yr = '2015' and account_nbr = a.account_nbr and fin_object_cd = a.fin_object_cd and fin_sub_obj_cd = a.fin_sub_obj_cd)
and not exists (
select 1
from ca_sub_object_cd_t
where univ_fiscal_yr = '2017' and account_nbr = a.account_nbr and fin_object_cd = a.fin_object_cd and fin_sub_obj_cd = a.fin_sub_obj_cd)
and a.univ_fiscal_yr = '2016'
and a.acln_annl_bal_amt <> 0
group by a.account_nbr || a.fin_object_cd || a.fin_sub_obj_cd,
a.univ_fiscal_yr,
a.fin_coa_cd,
a.account_nbr,
a.fin_object_cd,
a.fin_sub_obj_cd,
b.sub_fund_grp_cd,
b.acct_closed_ind,
a.fin_balance_typ_cd
order by a.account_nbr;

spool off
