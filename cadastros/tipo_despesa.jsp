<%@ page contentType="text/html;  charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>

<link rel="stylesheet" type="text/css" href="styles/skilltec.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="styles/forms.css" media="screen"/>
<script language="JavaScript" src="JS/util.js" type="text/javascript"></script>
<title>SkillTec</title>
<s:head/>
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
		<h3>Cadastro de Tipo de Despesa</h3>
		<p class="add"> <a href="TipoDespesa!listObjects.action"><img src="imagens/list.jpg" border="0"> Listar Tipos de Despesas</a></p>
	
		<s:include value="../mensagens.inc.jsp"/>			

		<div id="div_formulario">

	<s:form
		id="TipoDespesaForm"
		action="TipoDespesainsertOrUpdate"
		method="post"
		validate="true">
		<s:if test="tipoDespesa.tipoDespesaId != null">
			<s:textfield key="tipoDespesa.tipoDespesaId" required="true" size="50" readonly="true"/>
		</s:if>			
		<s:textfield key="tipoDespesa.descricao" required="true" maxlength="200" size="70"/>
		<s:select key="tipoDespesa.unidadeMedida" required="true" list="unidadesMedidas"/>		
		<s:submit key="confirmar"/>
		
	</s:form>
		</div>
	
	</div>

	</div>
	<jsp:include page="../rodape.htm"/>

</div>
</body>
</html>