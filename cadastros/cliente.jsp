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
<s:head theme="ajax" />
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
		<h3>Cadastro de Cliente</h3>
		<p class="add"> <a href="Cliente!listObjects.action"><img src="imagens/list.jpg" border="0"> Listar Clientes</a></p>
	
		<s:include value="../mensagens.inc.jsp"/>			

		<div id="div_formulario">
	<s:form
		id="ClienteForm"
		action="ClienteinsertOrUpdate"
		method="post"
		validate="true">
		<s:if test="cliente.clienteId != null">
			<s:textfield key="cliente.clienteId" required="true" size="50" readonly="true"/>
		</s:if>			
		<s:textfield key="cliente.razaoSocial" required="true" maxlength="200" size="60"/>
		<s:textfield key="cliente.nome" required="true" maxlength="100" size="60"/>
		<s:textfield key="cliente.ramoAtividade" maxlength="100" size="60"/>
		<s:textfield key="cliente.iss" required="true" maxlength="10" size="15" tooltip="Utilize v�rgula (,) para separar as casas decimais."/>
		<s:textfield key="cliente.cnpjCpf" required="true" maxlength="25" size="20"/>
		<s:textfield key="cliente.inscricaoEstatual"  maxlength="50" size="35"/>
		<s:textfield key="cliente.inscricaoMunicipal"  maxlength="50" size="35"/>
		<s:textarea key="cliente.descricao" labelposition="left" rows="5" cols="50"/>
		<s:textfield key="cliente.dataFaturamento" required="true" maxlength="2" size="10"/>
		<s:checkbox key="cliente.inativo" labelposition="right"/>
		<tr>
			<td colspan="2">
				<fieldset>
					<legend>Contato</legend>
					<table>
						<s:textfield key="cliente.contato" required="true" maxlength="100" size="40"/>
						<s:textfield key="cliente.email" required="true" maxlength="150" size="40"/>
						<s:textfield key="cliente.emailCobranca" required="true" maxlength="150" size="40"/>
						<s:textfield key="cliente.telefone1" required="true" maxlength="10" size="25"/>
						<s:textfield key="cliente.telefone2" maxlength="10" size="25"/>
						<s:textfield key="cliente.fax"  maxlength="10" size="25"/>
					</table>
				</fieldset>
			</td>			
		</tr>
		<tr>
			<td colspan="2">
				<fieldset>
					<legend>Endereço</legend>
					<table>
						<s:textfield key="cliente.rua" maxlength="100" size="40"/>
						<s:textfield key="cliente.bairro"  maxlength="100" size="40"/>
						<s:textfield key="cliente.cidade"  maxlength="100" size="40"/>
						<s:autocompleter key="cliente.estado" href="TodosEstados.action" autoComplete="false"  forceValidOption="false" showDownArrow="false" />
						<s:textfield key="cliente.pais"  maxlength="50" size="40"/>
					</table>
				</fieldset>
			</td>			
		</tr>
		<tr>
			<td colspan="2">
				<fieldset>
					<legend>Endereço Comercial</legend>
					<table>
						<s:textfield key="cliente.ruaComercial" required="true" maxlength="100" size="40"/>
						<s:textfield key="cliente.bairroComercial" required="true" maxlength="100" size="40"/>
						<s:textfield key="cliente.cidadeComercial" required="true" maxlength="100" size="40"/>
						<s:autocompleter key="cliente.estadoComercial" required="true" href="TodosEstados.action" autoComplete="false"  forceValidOption="false" showDownArrow="false" />
					</table>
				</fieldset>
			</td>			
		</tr>
		<s:submit key="confirmar"/>
		
	</s:form>
</div>
	
	</div>

	</div>
	<jsp:include page="../rodape.htm"/>

</div>
</body>
</html>