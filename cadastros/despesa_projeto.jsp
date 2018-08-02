<%@ page contentType="text/html;  charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="displaytag" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>
<link rel="stylesheet" type="text/css" href="styles/displaytag.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="styles/skilltec.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="styles/forms.css" media="screen"/>
<script language="JavaScript" src="JS/util.js" type="text/javascript"></script>
<script>
function validaForm()
{
	var projeto = document.getElementById("projetoIdField");
	if(projeto.value < 1)
	{
		alert("Selecione um projeto para prosseguir.");
		return false;
	}
}

</script>
<title>SkillTec</title>
<s:head theme="ajax"/>
</head>
<body>
<div id="wrap">
	<jsp:include page="../header.htm"/>	
	<div id="avmenu">
		<jsp:include page="../menu_interno.jsp"/>		
		<jsp:include page="../login.jsp"/>
	</div>
	<div id="content2">
		<h2>GEPS &#8211; Gest&atilde;o de Projetos Skilltec </h2>
		<h3>Apontamento de Despesas do Projeto</h3>
		<s:include value="../mensagens.inc.jsp"/>		
				
		<s:form
			onsubmit="return validaForm()"
			id="ApontamentoDespesaForm"
			name="ApontamentoDespesaForm"
			method="post">			
			<s:select key="projetoId"
				  id="projetoIdField"
				  list="projetos"
				  listKey="projetoId"
				  listValue="nome"
				  headerKey="-1"
				  required="true"
				  headerValue="-- Selecione um projeto --"/>
			<s:datetimepicker key="periodoInicial" id="periodoInicial" language="pt_BR" displayFormat="dd/MM/yy" required="true"/>	
			<s:datetimepicker key="periodoFinal" id="periodoFinal" language="pt_BR" displayFormat="dd/MM/yy" required="true"/>		  
			<tr>
				<td colspan="2">  
					<s:submit targets="divResult" template="submit_skilltec.ftl" value="Visualizar Despesas"   formId="ApontamentoDespesaForm" loadingText="<img src='imagens/busy.gif' style='padding-right:5px;'/><font color=red>Por favor aguarde. Processando consulta ....</font>" href="Despesas!listObjects.action" theme="ajax"></s:submit>
					<s:submit targets="divResult" template="submit_skilltec.ftl" value="Adicionar Despesas" formId="ApontamentoDespesaForm" showLoadingText="false" href="Despesas!adicionarGastos.action" theme="ajax"></s:submit>
				</td>
			</tr>			
		</s:form>
		
		
		<s:div id="divResult">
		</s:div>
		
		
	</div>
	<jsp:include page="../rodape.htm"/>
</div>

</body>
</html>