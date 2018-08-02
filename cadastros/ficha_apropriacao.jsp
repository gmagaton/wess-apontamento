<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="displaytag" prefix="display"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>SkillTec</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>
<link rel="stylesheet" type="text/css" href="styles/displaytag.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="styles/skilltec.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="styles/forms.css" media="screen"/>
<script language="JavaScript" src="JS/util.js" type="text/javascript"></script>
<s:head theme="ajax"/>
<script>
function updateTarget() 
{
      var triggerId = document.getElementById("triggerId");
      var triggerValue = triggerId.value;

      var triggerWidget = dojo.widget.byId("targetDivId");
      //alert(triggerWidget);

      var target = document.getElementById("targetDivId");
      var url = target.getAttribute("href");

      var newUrl = "FichaApropriacao!updateTarget.action?triggerValue=" + triggerValue;
      triggerWidget.setUrl(newUrl);

      /* this publishes the topic, which is registered to the div tag, causing it to refresh itself. */
      dojo.event.topic.publish("updateTargetTopic", "triggerValue:" + triggerValue);

      /* this is an alternative to publish (above) */
      //triggerWidget.refresh();
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
		<h3>FA - Ficha de Apropria��o</h3>
		<s:include value="../mensagens.inc.jsp"/>	
		<s:form
			id="FichaApropriacaoForm"
			name="FichaApropriacaoForm"
			method="post"
			action="FichaApropriacaosetarFA"
			validate="true"
			theme="ajax">
			<s:datetimepicker key="periodoInicial" id="periodoInicial" language="pt_BR" displayFormat="dd/MM/yy" required="true"/>	
			<s:datetimepicker key="periodoFinal" id="periodoFinal" language="pt_BR" displayFormat="dd/MM/yy" required="true" />	
			<s:if test="#session.NIVEL_ACESSO == 2 " >
				<s:select 
					list="clientesPorConsultor" 
					listKey="clienteId" 
					listValue="nome"
					emptyOption="-- Selecione um Cliente --"
					headerKey="-1"
					headerValue="-- Selecione um Cliente --"
					key="clienteId"
					required="true"/>
			</s:if>
			<s:else>
				<s:select 
					id="triggerId" 
					list="todosConsultores" 
					listKey="consultorId" 
					listValue="nome"
					emptyOption="-- Selecione um Consultor --"
					headerKey="-1"
					headerValue="-- Selecione um Consultor --"
					key="consultorId"
					label="Consultor"
					onchange="javascript:updateTarget();"/>
				<tr>
					<td class="tdLabel"><label class="label" for="FichaApropriacaoForm_clienteId">Cliente<span class="required">*</span>:</label></td>
					<td>
			        	<s:url id="target_url" value="FichaApropriacao!updateTarget.action" >
			            	<s:param name="triggerValue" value="%{consultorId}" />			            	
			           	</s:url>
			           	<s:div 
			           		id="targetDivId" 
			           		theme="ajax" 
			           		listenTopics="updateTargetTopic"   
			           		href="%{target_url}"></s:div>
					</td>
			    </tr>
			</s:else>
			 <tr>
				<td colspan="2">  
					<input type="submit" value="Gerar FA" />
					<s:submit targets="relatorioFA" template="submit_skilltec.ftl" value="FA Geradas"   formId="FichaApropriacaoForm" loadingText="<img src='imagens/busy.gif' style='padding-right:5px;'/><font color=red>Por favor aguarde. Processando consulta ....</font>" href="FichaApropriacao!listObjects.action" theme="ajax"></s:submit>
				</td>
			</tr>
			
		</s:form>
		<div id="relatorioFA"></div>
	</div>
	
	<jsp:include page="../rodape.htm"/>
</div>

</body>
</html>