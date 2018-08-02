<%@ page contentType="text/html;  charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="displaytag" prefix="display"%>
<%@ taglib uri="core" prefix="c"%>


<s:head theme="ajax"/>
<s:div id = "AtividadesDoProjeto">
<s:include value="../mensagens.inc.jsp"/>
<h3>Recursos alocados no Projeto</h3>
<display:table 
	id="projetoConsultoresDTO"
	name="LISTOBJECTS"
	requestURI="AlocaRecurso!listObjects.action"
	decorator="com.cec.skilltec.web.decorators.ProjetoHasConsultorDec">	
	<display:column property="consultores.nome" title="Consultor" />
	<display:column property="atividades.descricao" title="Atividade"/>
	<display:column property="tiposHorasProjeto" title="Tipos de Horas"/>
	<display:column property="horasEstimadas" title="Horas Estimadas" format="{0,number,0.00}"/>
	<display:column media="html" style="text-align:center;">	
		<s:url id="editar_url" action="AlocaRecurso"  method="retrieveById">
            <s:param name="recurso.projetoConsultorId"><c:out value="${projetoConsultoresDTO.projetoConsultorId}"/></s:param>
            <s:param name="recurso.projetos.projetoId"><c:out value="${projetoConsultoresDTO.projetos.projetoId}"/></s:param>
        </s:url>        
		<s:a href="%{editar_url}" targets="AtividadesDoProjeto" theme="ajax" showLoadingText="false">
			<img src="imagens/application_edit.png" align="middle" border="0" alt="<s:text name="editar.alt"/>"/>
		</s:a>		
	</display:column>
	<display:column media="html" style="text-align:center;">			
		<s:url id="remover_url" action="AlocaRecurso"  method="remove" >
            <s:param name="recurso.projetoConsultorId"><c:out value="${projetoConsultoresDTO.projetoConsultorId}"/></s:param>
            <s:param name="recurso.projetos.projetoId"><c:out value="${projetoConsultoresDTO.projetos.projetoId}"/></s:param>
        </s:url>     
		<s:a href="%{remover_url}" targets="AtividadesDoProjeto" theme="ajax" showLoadingText="false">
			<img src="imagens/lixeira.png" align="middle"  border="0" alt="<s:text name="remocao.alt"/>"/>
		</s:a>		
	</display:column>	
	<display:column media="html" style="text-align:center;" title="Hr/Cons">	
		<s:url id="preco_consultor" action="TabelaPreco"  method="precoConsultor">
            <s:param name="recurso.projetoConsultorId"><c:out value="${projetoConsultoresDTO.projetoConsultorId}"/></s:param>
            <s:param name="recurso.projetos.projetoId"><c:out value="${projetoConsultoresDTO.projetos.projetoId}"/></s:param>            
        </s:url>        
		<s:a href="%{preco_consultor}" targets="AtividadesDoProjeto" theme="ajax" loadingText="<img src='imagens/busy.gif' style='padding-right:5px;'/><font color=red>Por favor aguarde. Processando consulta ....</font>" >
			<img src="imagens/tabela.bmp" align="middle" border="0" alt="Clique aqui para visualizar valor Hora/Consultor"/>
		</s:a>		
	</display:column>
	<display:column media="html" style="text-align:center;" title="Hr/Cli">	
		<s:url id="preco_cliente" action="TabelaPreco"  method="precoCliente">
            <s:param name="recurso.projetoConsultorId"><c:out value="${projetoConsultoresDTO.projetoConsultorId}"/></s:param>
            <s:param name="recurso.projetos.projetoId"><c:out value="${projetoConsultoresDTO.projetos.projetoId}"/></s:param>            
        </s:url>        
		<s:a href="%{preco_cliente}" targets="AtividadesDoProjeto" theme="ajax" loadingText="<img src='imagens/busy.gif' style='padding-right:5px;'/><font color=red>Por favor aguarde. Processando consulta ....</font>" >
			<img src="imagens/tabela.bmp" align="middle" border="0" alt="Clique aqui para visualizar valor Hora/Cliente"/>
		</s:a>		
	</display:column>			
</display:table>
</s:div>
	