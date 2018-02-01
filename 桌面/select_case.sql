SELECT
	t0.*
FROM
	decorate_case t0
<#list arrayList as item>  
,decorate_case_spec t${item_index+1}  
</#list>  
WHERE 1=1
<#list arrayList as item>  
AND t0.id = t${item_index+1}.case_id
</#list>
<#list arrayList as item>  
AND t${item_index+1}.spec_id = '${item}'
</#list>  


SELECT
	t0.*
FROM
	decorate_case t0
 	,decorate_case_spec t1
 	,decorate_case_spec t2
 ,decorate_case_spec t3
WHERE 1=1
 AND t0.id = t1.case_id
 AND t0.id = t2.case_id
 AND t0.id = t3.case_id
 AND t1.spec_id = '402883ca6112d472016112db3c6b0008'
 AND t2.spec_id = '402883ca6112d472016112dc445c0010'
 AND t3.spec_id = '402883ca6112d472016112dd32ea0019'

