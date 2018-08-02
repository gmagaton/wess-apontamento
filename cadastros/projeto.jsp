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
		<h3>Cadastro de Projeto</h3>
		<p class="add"> <a href="Projeto!listObjects.action"><img src="imagens/list.jpg" border="0"> Listar Projetos</a></p>	
		<s:include value="../mensagens.inc.jsp"/>
		<s:form
			id="ProjetoForm"
			action="ProjetoinsertOrUpdate"
			method="post"
			validate="true">
			<s:if test="projeto.projetoId != null">
				<s:textfield key="projeto.projetoId" required="true" size="50" readonly="true"/>
			</s:if>			
			<s:textfield key="projeto.nome" required="true" maxlength="150" size="70"/>
			<s:select 
				list="clientes" 
				listKey="clienteId" 
				listValue="razaoSocial"
				emptyOption="-- Selecione um Cliente --"
				headerKey="-1"
				headerValue="-- Selecione um Cliente --"
				key="projeto.clientes.clienteId"
				required="true"/>
			<s:textfield key="projeto.responsavel" required="true" maxlength="150" size="70"/>
			<s:textfield key="projeto.gerente" required="true" maxlength="150" size="70"/>
			<s:select 
				list="tiposProjetos" 
				listKey="tipoProjetoId" 
				listValue="descricao"
				emptyOption="-- Selecione um Tipo de Projeto --"
				headerKey="-1"
				headerValue="-- Selecione um Tipo de Projeto --"
				key="projeto.tiposProjeto.tipoProjetoId"
				required="true"/>
			<s:datetimepicker key="projeto.dataInicio" required="true" language="pt_BR" displayFormat="dd/MM/yyyy" />	
			<s:datetimepicker key="projeto.dataFim" required="true" language="pt_BR" displayFormat="dd/MM/yyyy"/>
			<s:textarea key="projeto.descricao" labelposition="left" rows="5" cols="50"/>
			<s:textarea key="projeto.descricaoDespesas" labelposition="left" rows="5" cols="50"/>
			<s:textarea key="projeto.observacoes" labelposition="left" rows="5" cols="50"/>
			<s:textfield key="projeto.quantidadeHorasContratadas" labelposition="left" />
			<s:textfield key="projeto.valorHora" labelposition="left" />
			<s:submit key="confirmar"/>
		</s:form>
	</div>
	</div>
	<jsp:include page="../rodape.htm"/>
</div>
</body>
</html>