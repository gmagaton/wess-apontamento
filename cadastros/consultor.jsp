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
		<h3>Cadastro de Consultor</h3>
		<p class="add"> <a href="Consultor!listObjects.action"><img src="imagens/list.jpg" border="0"> Listar Consultores</a></p>
	
		<s:include value="../mensagens.inc.jsp"/>			

		<div id="div_formulario">

	<s:form
		id="ConsultorForm"
		action="ConsultorinsertOrUpdate"
		method="post"
		validate="true">
		<s:if test="consultor.consultorId != null">
			<s:textfield key="consultor.consultorId" required="true" size="50" readonly="true"/>
		</s:if>			
		<s:textfield key="consultor.nome" required="true" maxlength="150" size="50"/>
		<s:textfield key="consultor.cpf" required="true" maxlength="11" size="20"/>	
		<s:textfield key="consultor.rg" required="true" maxlength="15" size="20"/>			
		<s:datetimepicker key="consultor.dataNascimento" required="true" language="pt_BR" displayFormat="dd/MM/yyyy"/>
		<s:textfield key="consultor.email" required="true"  maxlength="150" size="50"/>	
		<s:textfield key="consultor.atividade"  maxlength="100" size="50"/>
		<s:textfield key="consultor.valorHora"  maxlength="100" size="20"/>
		<s:textarea key="consultor.descricao" labelposition="left" rows="5" cols="50"/>
		<s:textarea key="consultor.observacao" labelposition="left" rows="5" cols="50"/>
		<s:checkbox key="consultor.inativo" labelposition="right"/>
		<tr>
			<td colspan="2">
				<fieldset>
					<legend>Acesso ao Sistema</legend>
					<table>
						<s:textfield key="login.usuario"  maxlength="20" size="35" required="true"/>
						<s:password key="login.senha"  maxlength="15" size="25" required="true" showPassword="true"/>
						<s:password key="confirmaSenha"  maxlength="15" size="25" required="true" showPassword="true"/>
						<s:select key="login.nivelAcesso" list="#{'1':'Administrador', '3':'Gerente de Projeto', '2':'Operacional'}" required="true"/>	
					</table>
				</fieldset>
			</td>
		</tr>		
		<tr>
			<td colspan="2">
				<fieldset>
					<legend>Contato</legend>
					<table>
						<s:textfield key="consultor.telContato"  maxlength="10" size="15"/>
						<s:textfield key="consultor.telResidencial"  maxlength="10" size="15"/>
						<s:textfield key="consultor.telCelular"  maxlength="10" size="15"/>						
					</table>
				</fieldset>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			    <fieldset>
                    <legend>Dados admissionais</legend>
				    <table>
				        <s:datetimepicker key="consultor.admissao" language="pt_BR" displayFormat="dd/MM/yyyy"/>
				        <s:datetimepicker key="consultor.demissao" language="pt_BR" displayFormat="dd/MM/yyyy"/>
				    </table>
				</fieldset>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<fieldset>
					<legend>Endereço</legend>
					<table>
						<s:textfield key="consultor.rua"  maxlength="100" size="50"/>
						<s:textfield key="consultor.bairro"  maxlength="100" size="50"/>
						<s:textfield key="consultor.cidade"  maxlength="100" size="50"/>
						<s:autocompleter key="consultor.estado" href="TodosEstados.action" autoComplete="false"  forceValidOption="false" showDownArrow="false" />
					</table>
				</fieldset>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<fieldset>
					<legend>Informações Bancárias</legend>
					<table>
						<s:textfield key="consultor.banco"  maxlength="50" size="50"/>
						<s:textfield key="consultor.agencia"  maxlength="50" size="50"/>
						<s:textfield key="consultor.contaCorrente"  maxlength="50" size="50"/>
					</table>
				</fieldset>
			</td>
		</tr>
		<tr>
			<td class="tdLabel"><label class="label">Principais Empresas</label></td>
			<td>
				<s:checkboxlist
					list="empresas" 
					listKey="empresaId" 
					listValue="razaoSocial"			
					key="principaisEmpresas"
					theme="simple" template="checkbox_skilltec.ftl"/>
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