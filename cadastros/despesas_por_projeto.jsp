<%@ page contentType="text/html;  charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="displaytag" prefix="display"%>
<%@ taglib uri="core" prefix="c"%>


<s:head theme="ajax"/>
<s:div id = "DespesasPorProjeto">
<s:include value="../mensagens.inc.jsp"/>
<h3>Despesas apontadas no Projeto</h3>
<display:table 
	id="despesaProjetoDTO"
	name="LISTOBJECTS"
	requestURI="Despesas!listObjects.action"
	decorator="org.displaytag.decorator.TotalTableDecorator">	
	<display:column property="despesaProjetoId" title="C�digo" />
	<display:column property="consultores.nome" title="Consultor"/>
	<display:column property="tiposDespesas.descricao" title="Despesa"/>
	<display:column property="quantidade" title="Quantidade"/>
	<display:column property="tiposDespesas.unidadeMedida" title="Medida"/>	
	<display:column property="dataDespesa" title="Data" format="{0,date,dd/MM/yyyy}"/>	
	<display:column property="valorTotal" title="Valor Total" total="true" format="{0,number,R$ 0.00}"/>	
	<display:column media="html" style="text-align:center;">	
		<c:if test="${despesaProjetoDTO.faturado == false}">
			<s:url id="editar_url" action="Despesas"  method="retrieveById">
	            <s:param name="despesa.despesaProjetoId"><c:out value="${despesaProjetoDTO.despesaProjetoId}"/></s:param>
	            <s:param name="projetoId"><c:out value="${despesaProjetoDTO.projetos.projetoId}"/></s:param>
	        </s:url>        
			<s:a href="%{editar_url}" targets="DespesasPorProjeto" theme="ajax" showLoadingText="false">
				<img src="imagens/application_edit.png" align="middle" border="0" alt="<s:text name="editar.alt"/>"/>
			</s:a>		
		</c:if>
	</display:column>	
	<display:column media="html" style="text-align:center;">	
		<c:if test="${despesaProjetoDTO.faturado == false}">
			<s:url id="remover_url" action="Despesas"  method="remove" >
	            <s:param name="despesa.despesaProjetoId"><c:out value="${despesaProjetoDTO.despesaProjetoId}"/></s:param>
	            <s:param name="projetoId"><c:out value="${despesaProjetoDTO.projetos.projetoId}"/></s:param>
	        </s:url>     
			<s:a href="%{remover_url}" targets="DespesasPorProjeto" theme="ajax" showLoadingText="false">
				<img src="imagens/lixeira.png" align="middle"  border="0" alt="<s:text name="remocao.alt"/>"/>
			</s:a>	
		</c:if>	
	</display:column>				
</display:table>
</s:div>
	