<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="displaytag" prefix="display"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>

<link rel="stylesheet" type="text/css" href="styles/skilltec.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="styles/forms.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="styles/displaytag.css" media="screen"/>
<script language="JavaScript" src="JS/util.js" type="text/javascript"></script>
<title>SkillTec</title>
</head>

<body >
<div id="wrap">

	<jsp:include page="../header.htm"/>
	
	<div id="avmenu">
	<jsp:include page="../menu_interno.jsp"/>
	
	<jsp:include page="../login.jsp"/>
	</div>

	<div id="content2">
		<h2>GEPS &#8211; Gest&atilde;o de Projetos Skilltec </h2>
		<h3>Lista de Tipos de Projetos</h3>
		<p class="add"> <s:a href="TipoProjeto.action"><img src="imagens/new.jpg" border="0" />Adicionar Tipo de Projeto</s:a></p>

		<s:include value="../mensagens.inc.jsp"/>	

<display:table 
	id="tipoProjetoDTO"
	name="LISTOBJECTS"
	requestURI="TipoProjeto!listObjects.action"
	export="true"
	pagesize="30">	
	<display:caption media="pdf">Tipos de Projetos</display:caption>
	<display:column property="tipoProjetoId" title="C�digo" sortable="true"/>
	<display:column property="descricao" title="Descri��o" sortable="true"/>	
	<display:column media="html" style="text-align:center;">	
		<s:url id="editar_url" action="TipoProjeto"  method="retrieveById">
            <s:param name="tipoProjeto.tipoProjetoId" value="#attr.tipoProjetoDTO.tipoProjetoId"/>
        </s:url>        
		<s:a href="%{editar_url}">
			<img src="imagens/application_edit.png" align="middle" border="0" alt="<s:text name="editar.alt"/>"/>
		</s:a>		
	</display:column>
	<display:column media="html" style="text-align:center;">	
		<s:url id="remover_url" action="TipoProjeto"  method="remove">
            <s:param name="tipoProjeto.tipoProjetoId" value="#attr.tipoProjetoDTO.tipoProjetoId"/>
        </s:url>        
		<s:a href="%{remover_url}">
			<img src="imagens/lixeira.png" align="middle" onClick="return confirmDeleteRecord()" border="0" alt="<s:text name="remocao.alt"/>"/>
		</s:a>		
	</display:column>
</display:table>

	</div>

	<jsp:include page="../rodape.htm"/>

</div>
	
</body>
</html>