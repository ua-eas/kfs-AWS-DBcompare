set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/kfs3_ld_ldgr.xls


select ll.UNIV_FISCAL_YR, ll.ACCOUNT_NBR, ca.ACCOUNT_NM, cs.FUND_GRP_CD, cs.SUB_FUND_GRP_CD, ll.TRN_LDGR_ENTR_DESC, ll.POSITION_NBR, ll.EMPLID, ca.ORG_CD, co.ORG_NM, co.RPTS_TO_ORG_CD , SUM(CASE WHEN ll.trn_debit_crdt_cd='C' THEN ll.trn_ldgr_entr_amt * -1 ELSE ll.trn_ldgr_entr_amt END) as True_Dollar_Value  

from LD_LDGR_ENTR_T ll
inner join CA_ACCOUNT_T ca
on ll.ACCOUNT_NBR = ca.ACCOUNT_NBR
inner join CA_SUB_FUND_GRP_T cs
on ca.SUB_FUND_GRP_CD = cs.SUB_FUND_GRP_CD
inner join CA_ORG_T co
on ca.ORG_CD = co.ORG_CD
where ll.UNIV_FISCAL_YR in ('2016', '2017')
and ll.FIN_BALANCE_TYP_CD = 'AC'
and cs.FUND_GRP_CD = 'AG'
and cs.SUB_FUND_GRP_CD <> 'PRCLRG'
group by ll.UNIV_FISCAL_YR, ll.ACCOUNT_NBR, ca.ACCOUNT_NM,cs.FUND_GRP_CD, cs.SUB_FUND_GRP_CD, ll.TRN_LDGR_ENTR_DESC, ll.POSITION_NBR, ll.EMPLID, ca.ORG_CD, co.ORG_NM, co.RPTS_TO_ORG_CD;

spool off
