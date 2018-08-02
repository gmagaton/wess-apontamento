<%@ page contentType="text/html;  charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="displaytag" prefix="display"%>
<%@ taglib uri="core" prefix="c"%>

<s:head theme="ajax"/>
<s:div id = "divPrecoCliente">
<s:include value="../mensagens.inc.jsp"/>
<h3>Valor da Hora do Cliente no Projeto</h3>
<div>
<b>Consultor: </b><i><s:property value="recurso.consultores.nome"/></i> <br>
<b>Projeto: </b><i><s:property value="recurso.projetos.nome"/></i>
<b style="padding-left: 20px;">Atividade: </b><i><s:property value="recurso.atividades.descricao"/></i>
</div>
<display:table 
	id="precoClienteDTO"
	name="LISTOBJECTS"
	requestURI="TabelaPreco!precoCliente.action">	
	<display:setProperty name="basic.msg.empty_list" value="Nenhum valor de hora foi cadastrado para o consultor no projeto."/>
	<display:column property="periodoDe" title="Vig�ncia De" format="{0,date,dd-MM-yy}"/>
	<display:column property="periodoAte" title="Vig�ncia At�" format="{0,date,dd-MM-yy}"/>
	<display:column property="valor" title="Valor" format="{0,number,0.00}"/>
	<display:column media="html">	
		<s:url id="editar_url" action="TabelaPreco"  method="retrieveByIdPrecoCliente">
            <s:param name="precoCliente.precoClienteId"><c:out value="${precoClienteDTO.precoClienteId}"/></s:param>
	        <s:param name="recurso.projetoConsultorId"><c:out value="${precoClienteDTO.projetosHasConsultores.projetoConsultorId}"/></s:param>         
        </s:url>        
		<s:a href="%{editar_url}" targets="divPrecoCliente" theme="ajax" showLoadingText="false">
			<img src="imagens/application_edit.png" align="middle" border="0" alt="<s:text name="editar.alt"/>"/>
		</s:a>	
		<c:if test="${precoClienteDTO.podeRemover == true}">
			<s:url id="remove_preco_cliente" action="TabelaPreco"  method="removePrecoCliente" >
	            <s:param name="precoCliente.precoClienteId"><c:out value="${precoClienteDTO.precoClienteId}"/></s:param>
	            <s:param name="recurso.projetoConsultorId"><c:out value="${precoClienteDTO.projetosHasConsultores.projetoConsultorId}"/></s:param>            
	        </s:url>
	        <s:a href="%{remove_preco_cliente}"   targets="divPrecoCliente" theme="ajax" loadingText="<img src='imagens/busy.gif' style='padding-right:5px;'/><font color=red>Por favor aguarde. Processando consulta ....</font>" >
				<img src="imagens/lixeira.png" align="middle" border="0" alt="<s:text name="remover.alt"/>"/>
			</s:a>	
		</c:if>
	</display:column>		
</display:table>

<div id="addPreco">
<s:form action="TabelaPrecoaddPrecoCliente" id="PrecoClienteForm" >
	<s:hidden key="recurso.projetoConsultorId"/>
	<s:if test="precoCliente.precoClienteId == null">
		<s:datetimepicker key="precoCliente.periodoDe" required="true" language="pt_BR" displayFormat="dd/MM/yyyy"/>
		<s:datetimepicker key="precoCliente.periodoAte" required="true" language="pt_BR" displayFormat="dd/MM/yyyy"/>
		<s:textfield key="valor" required="true" onblur="formatDouble(this);"/>
	</s:if>	
	<s:else>
		<s:hidden key="precoCliente.precoClienteId"/>
		<s:hidden key="precoCliente.periodoDe"/>
		<s:datetimepicker key="precoCliente.periodoAte" required="true" language="pt_BR" displayFormat="dd/MM/yyyy"/>
		<s:textfield key="valor" required="true" onblur="formatDouble(this);"/>
	</s:else>
	
	
	<s:submit targets="divPrecoCliente" theme="ajax" formId="PrecoClienteForm" showLoadingText="false" value="Confirmar"/>
	
	
</s:form>
</div>
</s:div>