<%@ page contentType="text/html;  charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="displaytag" prefix="display"%>
<%@ taglib uri="core" prefix="c"%>

<s:head theme="ajax"/>
<s:div id = "FichaApropriacaoListagem">
<s:include value="../mensagens.inc.jsp"/>
<h3>FA Geradas por Per�odo</h3>
<display:table 
	id="faDTO"
	name="LISTOBJECTS"
	requestURI="FichaApropriacao!listObjects.action">	
	<display:column property="fichaApropriacaoId" title="FA #"/>	
	<display:column property="consultoresByGeradoPor.nome" title="Gerado por"/>	
	<display:column property="dataCriacao" title="Gerado em" format="{0,date,dd-MM-yy}"/>
	<display:column property="periodoDe" title="Per�odo de" format="{0,date,dd-MM-yy}"/>
	<display:column property="periodoAte" title="Per�odo At�" format="{0,date,dd-MM-yy}"/>
	<display:column property="consultoresByConsultorId.nome" title="Consultor"/>	
	<display:column property="clientes.nome" title="Cliente"/>
	<display:column media="html" style="text-align:center;">	
		<s:url id="remover_url" action="FichaApropriacao"  method="remove" >
	    	<s:param name="fichaApropriacao.fichaApropriacaoId"><c:out value="${faDTO.fichaApropriacaoId}"/></s:param>
	    </s:url>     
		<s:a href="%{remover_url}" targets="FichaApropriacaoListagem" theme="ajax" showLoadingText="false">
			<img src="imagens/lixeira.png" align="middle"  border="0" alt="<s:text name="remocao.alt"/>"/>
		</s:a>
	</display:column>
	<display:column media="html" style="text-align:center;">	
		<a target="_blank" href='FichaApropriacao!retrieve.action?fichaApropriacao.fichaApropriacaoId=<jsp:getProperty name="faDTO" property="fichaApropriacaoId"/>'>
			<img src="imagens/ico_file_pdf.png" align="middle"  border="0" alt="<s:text name="remocao.alt"/>"/>
		<a>
	</display:column>					
</display:table>
</s:div>
	