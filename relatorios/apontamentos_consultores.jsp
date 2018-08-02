<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="displaytag" prefix="display"%>
<%@ taglib uri="core" prefix="c"%>

<%@page import="java.util.Locale"%>
<h3>Total de Horas por Consultor</h3>
<s:include value="../mensagens.inc.jsp"/>	

 <jsp:scriptlet>  
	org.displaytag.decorator.MultilevelTotalTableDecorator subtotals = new org.displaytag.decorator.MultilevelTotalTableDecorator();  
        subtotals.setGrandTotalDescription("Total:");    // optional, defaults to Grand Total  
         //subtotals.setGrandTotalLabel("Grand");      // optional, defaults to "{0} Total"  
         //subtotals.setGrandTotalNoSum("setGrandTotalNoSum");
         subtotals.setSubtotalLabel("Sub-Total:", new Locale("pt", "BR"));
         pageContext.setAttribute("subtotaler", subtotals);  
      </jsp:scriptlet>  


<display:table 
	id="totalHorasPorConsultor"
	name="LISTOBJECTS"
	requestURI="VisualizarRelatorioHtml.action?tipoRelatorio=1"
	>	
	<display:caption media="pdf">Total de Horas por Consultor</display:caption>
	<display:column property="consultor" title="Consultor" group="1"/>
	<display:column property="projeto" title="Projeto"  group="2">
	</display:column>
	<display:column title="Atividades">
	<c:forEach var="atividadeDoProjeto" items="${totalHorasPorConsultor.atividadeProjetoConsultor}" >
		<c:out value="${atividadeDoProjeto.atividade}"></c:out>
		<c:set var="horasDoProjeto" value="${atividadeDoProjeto.apontamentosAtividade}" />	
		<display:table name="${horasDoProjeto}" id="apontamentos">
			<display:column property="tipoHora"  title="Detalhes"/>
			<display:column property="totalHoras"  title="Horas"/>
			<display:column property="valorTotal" title="Valor" total="true" format="{0,number,R$ 0.00}" class="valueAlign"/>
		</display:table>
	</c:forEach>
	</display:column>
	<display:column property="valorDespesas" title="Despesas"  format="{0,number,R$ 0.00}" total="true" class="valueAlign"/>
	
</display:table>
<!--
<c:set var="atividadesProjeto" value="${totalHorasPorConsultor.atividadeProjetoConsultor}" />
<display:table name="${atividadesProjeto}" id="atividadesDoProjeto" >
  		<c:set var="horasDoProjeto" value="${atividadesDoProjeto.apontamentosAtividade}" />	
		<display:column property="atividade"  />
		<display:column>
		  	<display:table name="${horasDoProjeto}" id="apontamentos" >
				<display:column property="tipoHora"  />
				<display:column property="totalHoras"  />
				<display:column property="valorTotal"  total="true"/>
			</display:table>
		</display:column>
	</display:table>
 -->