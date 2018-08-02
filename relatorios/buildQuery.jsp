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
<title>SkillTec</title>
<s:head theme="ajax"/>
<script>
function selecionaClientes()
{
	var selectField = document.getElementById("tipoRelatorio");
	var area = document.getElementById("area_clientes");
	if(selectField.value == 3) // Mostra total de horas e despesas por cliente
	{
		area.style.display = "block";
	}
	else
		area.style.display = "none";
}
</script>
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
		<h3>Relat�rios por Per�odo</h3>
		<s:include value="../mensagens.inc.jsp"/>		
				
		<s:form
			id="BuildQueryForm"
			name="BuildQueryForm"
			method="post"
			action="VisualizarRelatorioHtml"
			target="_blank">		
			<s:datetimepicker key="dataInicial" label="Data Inicial" required="true" language="pt_BR" displayFormat="dd/MM/yyyy"/>	
			<s:datetimepicker key="dataFinal" label="Data Final" required="true" language="pt_BR" displayFormat="dd/MM/yyyy"/>
			<s:if test="#session.NIVEL_ACESSO == 1 " >
				<s:select key="tipoRelatorio" id="tipoRelatorio" label="Relat�rio" list="#{'1':'Total de Horas Por Consultor', '2':'Total de horas de Todos Clientes', '3':'Total de Horas por Cliente', '4':'Faturamento'}" required="true" onchange="selecionaClientes();"/>
			</s:if>
			<s:elseif test="#session.NIVEL_ACESSO == 2" >
				<s:select key="tipoRelatorio" id="tipoRelatorio" label="Relat�rio" list="#{'5':'Total de Horas', '6':'Total de Horas Detalhada'}" required="true"/>		
			</s:elseif>
			<s:elseif test="#session.NIVEL_ACESSO == 3" >
				<s:select key="tipoRelatorio" id="tipoRelatorio" label="Relat�rio" list="#{'5':'Total de Horas', '6':'Total de Horas Detalhada', '3':'Total de Horas por Cliente'}" required="true" onchange="selecionaClientes();"/>		
			</s:elseif>			
			<tr id="area_clientes" style="display: none;">
				<td class="tdLabel">
					<label for="clienteIdField" class="label">Cliente:</label>
				</td>
				<td>
					<s:select key="clienteId"
							  label="Cliente"	
							  id="clienteIdField"
							  list="clientes"
							  listKey="clienteId"
							  listValue="nome"
							  headerKey="-1"
							  headerValue="-- Selecione um Cliente --"
							  theme="simple"/>
						<br>
						<s:checkbox id="marcarComo" key="faturado" label="Marcar como faturado" value="true" theme="simple"/>
						<label for="marcarComo" class="label">Marcar como Faturado?</label>
				</td>
			</tr>	
			<tr>
				<td colspan="2">  
					<s:submit  value="Visualizar"></s:submit>					
				</td>
			</tr>			
		</s:form>
		<s:div id="divResult"/>
		
		
		
	</div>
	<jsp:include page="../rodape.htm"/>
</div>

</body>
</html>