<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="hasActionErrors()">
	<div id="errorMessageBox">
		 <b><s:text name="titulo.mensagem.erro.action" /></b> 
	  	<div style="padding:5px;">
			<s:iterator value="actionErrors">
				<img src='imagens/errorMark.gif'> <s:property/> <br>
			</s:iterator>
		</div>
	</div>
</s:if>		
		
<s:if test="hasActionMessages()">	
	<div id="successMessageBox">
		<b><s:text name="titulo.mensagem.atencao" /></b> 
 			<div style="padding:5px;">
			<s:iterator value="actionMessages">
				<img src='imagens/successMark.gif'> <s:property/> <br>
			</s:iterator>
		</div>
	</div>		
</s:if>				