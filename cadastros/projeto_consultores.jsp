<%@ page contentType="text/html;  charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<h3>Selecione os consultores que estar�o alocados no projeto</h3>
<br>
<s:form
	id="ProjetoConsultoresForm"
	action="LocaConsultoresinsertOrUpdate"
	method="post"
	validate="true">
			
	<s:checkboxlist
			list="consultores" 
			listKey="consultorId" 
			listValue="nome"			
			key="consultoresDoProjeto" theme="simple" template="checkbox_skilltec.ftl"/>	
	<s:submit key="confirmar"/>
	
</s:form>

<script type="text/javascript">

</script>
		