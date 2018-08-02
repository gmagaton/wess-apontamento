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
		<h3>Meu Profile</h3>
		
		<s:include value="../mensagens.inc.jsp"/>			

		<div id="div_formulario">

	<s:form
		id="ConsultorForm"
		action="ConsultorinsertOrUpdate"
		method="post"
		validate="true">
		<s:hidden name="alterarProfile" value="yes"/>
		<s:hidden key="consultor.consultorId"/>
		<s:hidden key="principaisEmpresas"/>	
		
		<s:hidden key="consultor.cpf" />		
		<s:hidden key="consultor.dataNascimento"/>
		<s:hidden key="consultor.email"/>	
		<s:hidden key="consultor.atividade"/>
		<s:hidden key="consultor.descricao"/>
		<s:hidden key="consultor.telContato" />
		<s:hidden key="consultor.telResidencial"  />
		<s:hidden key="consultor.telCelular"  />		
		<s:hidden key="consultor.rua"  />
		<s:hidden key="consultor.bairro"  />
		<s:hidden key="consultor.cidade"  />
		<s:hidden key="consultor.estado" />
		<s:hidden key="consultor.banco" />
		<s:hidden key="consultor.agencia"  />
		<s:hidden key="consultor.contaCorrente"  />
		<s:textfield key="consultor.nome" required="true" maxlength="150" size="50" readonly="true"/>
		<tr>
			<td colspan="2">
				<fieldset>
					<legend>Acesso ao Sistema</legend>
					<table>
						<s:textfield key="login.usuario"  maxlength="20" size="35" required="true" readonly="true"/>
						<s:password key="login.senha"  maxlength="15" size="25" required="true" showPassword="true"/>
						<s:password key="confirmaSenha"  maxlength="15" size="25" required="true"/>
						<s:hidden key="login.nivelAcesso"/>			
						
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