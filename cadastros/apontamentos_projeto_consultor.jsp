<%@ page contentType="text/html;  charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="displaytag" prefix="display"%>
<%@ taglib uri="core" prefix="c"%>

<s:head theme="ajax"/>
<s:div id = "ApontamentosProjetoConsultor">
<s:include value="../mensagens.inc.jsp"/>
<h3>Recursos alocados no Projeto</h3>
<display:table 
	id="apontamentosDTO"
	name="LISTOBJECTS"
	requestURI="Apontamento!listObjects.action"
	decorator="com.cec.skilltec.web.decorators.ApontamentoHorasDec">	
	<display:column property="tiposHorasProjeto.projetosHasConsultores.atividades.descricao" title="Atividade"/>
	<display:column property="tiposHorasProjeto.tiposHoras.descricao" title="Tipo da Hora"/>	
	<display:column property="dataApontamento" title="Data" format="{0,date,dd-MM-yy}"/>
	<display:column property="horasTrabalhadas" title="Horas Trabalhadas"/>
	<display:column property="horasTrabalhadasDia" title="Total"/>
	
	<display:column property="servicoExecutado" title="Descri��o" maxWords="100"/>	
	<display:column media="html" style="text-align:center;">	
		<c:if test="${apontamentosDTO.faturado == false}">
			<s:url id="editar_url" action="Apontamento"  method="retrieveById">
	            <s:param name="apontamento.apontamentoHoraId"><c:out value="${apontamentosDTO.apontamentoHoraId}"/></s:param>
	            <s:param name="projetoId"><c:out value="${apontamentosDTO.tiposHorasProjeto.projetosHasConsultores.projetos.projetoId}"/></s:param>	            
	        </s:url>        	        
			<s:a href="%{editar_url}" targets="ApontamentosProjetoConsultor" theme="ajax" showLoadingText="false" >
				<img src="imagens/application_edit.png" align="middle" border="0" alt="<s:text name="editar.alt"/>"/>
			</s:a>	
		</c:if>	
	</display:column>
	<display:column media="html" style="text-align:center;">	
		<c:if test="${apontamentosDTO.faturado == false}">
			<s:url id="remover_url" action="Apontamento"  method="remove" >
	            <s:param name="apontamento.apontamentoHoraId"><c:out value="${apontamentosDTO.apontamentoHoraId}"/></s:param>
	            <s:param name="projetoId"><c:out value="${apontamentosDTO.tiposHorasProjeto.projetosHasConsultores.projetos.projetoId}"/></s:param>
	        </s:url>     
			<s:a href="%{remover_url}" targets="ApontamentosProjetoConsultor" theme="ajax" showLoadingText="false">
				<img src="imagens/lixeira.png" align="middle"  border="0" alt="<s:text name="remocao.alt"/>"/>
			</s:a>
		</c:if>		
	</display:column>				
</display:table>
</s:div>
	