<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="displaytag" prefix="display"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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

<script language="JavaScript">
function CheckMaskValue(maskControl, evt)
{
	var strText = maskControl.value;
    if ((evt.keyCode < 48) || (evt.keyCode > 57))
    {
    	evt.keyCode = 0;
   	}
}

function CheckMaskFormat(maskControl)
{

      var strText = maskControl.value;
      var a = strText.split(':');
      if (isNaN(a[0]))
      {
      	maskControl.value = '00:00';
      }
      else if (isNaN(a[1]))
      {

            if ((a[0].length == 5) || (a[0].length == 4))
            {
                  strText = strText.slice(0,2) + ':' + strText.slice(2,4);
                  maskControl.value = strText;
            }

            if (a[0].length == 3)
            {
                  strText = '0' + strText.slice(0,1) + ':' + strText.slice(1,3);
                  maskControl.value = strText;
            }

            if (a[0].length == 2)
            {
                  strText = strText.concat(':00');
                  maskControl.value = strText;
            }

            if (a[0].length == 1)
            {
                  strText = strText.concat(':00');
                  maskControl.value = strText;
            }
      }
      else if (a[1].length == 1)
      {
            strText = strText.concat('0');
            maskControl.value = strText;
      }
      else if (a[0].length == 1)
      {
            strText = '0' + strText;
            maskControl.value = strText;
      }
      strText = maskControl.value;  
      strText = strText.slice(3,5);
      if (strText > 59)
      {

            alert('Voc� deve utilizar no m�ximo 59 minutos.');
            maskControl.select();
            maskControl.focus();
      }
      strText = maskControl.value;
      strText = strText.slice(0,2);
      if (strText > 23)
      {
            alert('Voc� deve utilizar no m�ximo 23 horas.');
            maskControl.select();
            maskControl.focus();
      }
}
</script>

<title>SkillTec</title>
<s:head theme="ajax"/>

<script>
function updateTarget() 
{
      var projeto = document.getElementById("projetoIdField");
      var triggerId = document.getElementById("triggerId");
      var triggerValue = triggerId.value;

      var triggerWidget = dojo.widget.byId("targetDivId");
      //alert(triggerWidget);

      var target = document.getElementById("targetDivId");
      var url = target.getAttribute("href");

      var newUrl = "Apontamento!updateTarget.action?triggerValue=" + triggerValue;
      newUrl += "&projetoId=" + projeto.value;
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
		<h3>Apontamento de Horas</h3>
		<s:include value="../mensagens.inc.jsp"/>	
		<s:form
			onsubmit="return validaForm()"
			id="ApontamentoHoraForm"
			name="ApontamentoHoraForm"
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
					<s:submit targets="divResult" template="submit_skilltec.ftl" value="Apontamentos"   formId="ApontamentoHoraForm" loadingText="<img src='imagens/busy.gif' style='padding-right:5px;'/><font color=red>Por favor aguarde. Processando consulta ....</font>"  href="Apontamento!listObjects.action" theme="ajax"></s:submit>
					<s:submit targets="divResult" template="submit_skilltec.ftl" value="Adicionar Atividade" formId="ApontamentoHoraForm" showLoadingText="false" href="Apontamento!apontarServicoExecutado.action" theme="ajax"></s:submit>
				</td>
			</tr>	
					
		</s:form>
		
		
		<s:div id="divResult"></s:div>
		
		
	</div>
	<jsp:include page="../rodape.htm"/>
</div>

</body>
</html>