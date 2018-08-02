<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:head theme="ajax" calendarcss="style/calendar.css"/>
<s:div id="AddAtividadeParaConsultor">
<s:include value="../mensagens.inc.jsp"/>
<s:form
	id="AlocaRecursoForm2"
	name="AlocaRecursoForm2"
	method="post"
	action="AlocaRecursoAddAtividade"	
	validate="true"
	theme="ajax">
	<tr>
		<td colspan="2"><h3>Adiciona atividade ao Projeto</h3></td>
	</tr>
	<s:hidden name="recurso.projetos.projetoId"></s:hidden>	
	<s:hidden name="recurso.projetoConsultorId"></s:hidden>		
	<s:select key="recurso.atividades.atividadeId"
			  list="atividades"
			  listKey="atividadeId"
			  listValue="descricao"
			  required="true" 
			  headerKey="-1"
			  headerValue="-- Selecione uma atividade --"/>	
	<s:select key="recurso.consultores.consultorId"
			  list="consultores"
			  listKey="consultorId"
			  headerKey="-1"
			  headerValue="-- Selecione um Consultor --"	
			  listValue="nome"
			  required="true" />	
	<tr>
		<td class="tdLabel"><label class="label">Tipos de Horas:</label></td>
		<td>
			<s:checkboxlist
			list="tiposHoras" 
			listKey="tipoHoraId"
			listValue="descricao"	
			key="tiposHorasId"
			required="true"
			template="checkbox_skilltec.ftl"/>
		</td>
	</tr>
	<s:datetimepicker key="recurso.dataInicio" required="true" language="pt_BR" displayFormat="dd/MM/yyyy"/>	
	<s:datetimepicker key="recurso.dataFim" required="true" language="pt_BR" displayFormat="dd/MM/yyyy"/>
	<s:textfield key="recurso.horasEstimadas" required="true" maxlength="10" value="%{horasEstimadas}"/>
	<s:submit  value="Confirmar" targets="AddAtividadeParaConsultor" formId="AlocaRecursoForm2" showLoadingText="false"   ></s:submit>
</s:form>

</s:div>