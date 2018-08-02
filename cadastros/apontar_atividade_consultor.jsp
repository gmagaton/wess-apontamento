<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<s:div id="ApontarAtividadeDoConsultor">
<s:include value="../mensagens.inc.jsp"/>
<s:form
	id="ApontarAtividadeForm"
	name="ApontarAtividadeForm"
	method="post"
	action="ApontarAtividadeConsultor"	
	validate="true"
	theme="ajax">
	<tr>
		<td colspan="2"><h3>Apontar atividade ao Projeto</h3></td>
	</tr>
	<s:hidden name="projetoId"></s:hidden>	
	<s:hidden name="apontamento.apontamentoHoraId"></s:hidden>	
		
	<s:select 
		id="triggerId"  
		key="apontamento.tiposHorasProjeto.projetosHasConsultores.atividades.atividadeId"
        list="atividades" 
		listKey="atividadeId"
		listValue="descricao"
		headerKey="-1"
		headerValue="-- Selecione uma atividade --"	
		required="true"
		onchange="javascript:updateTarget();" />
		
		  
	<tr>
		<td class="tdLabel"><label class="label" for="targetSelectionId">Tipo da Hora<span class="required">*</span>:</label></td>
        <td>
        	<s:url id="target_url" value="Apontamento!updateTarget.action" >
            	<s:param name="triggerValue" value="%{apontamento.tiposHorasProjeto.projetosHasConsultores.atividades.atividadeId}" />
            	<s:param name="triggerTipoHora" value="%{apontamento.tiposHorasProjeto.tiposHoras.tipoHoraId}" />
            	
            	<s:param name="projetoId" value="%{projetoId}" />
           	</s:url>
           	<s:div 
           		id="targetDivId" 
           		theme="ajax" 
           		listenTopics="updateTargetTopic"   
           		href="%{target_url}"></s:div>
		</td>
     </tr>
	
	<s:datetimepicker key="apontamento.dataApontamento"  language="pt_BR" displayFormat="dd/MM/yy" required="true"/>	
	<tr>
			<td class="tdLabel"><label class="label">Período Manhã:</label></td>
			<td>
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td><label class="label">Entrada:</label></td>
						<td><label class="label">Saída:</label></td>
					</tr>
					<tr>
						<td><s:textfield key="horaInicioManha" theme="simple"  maxlength="4" size="15" onkeypress="CheckMaskValue(this event);" onchange="CheckMaskFormat(this);"/></td>
						<td><s:textfield key="horaTerminoManha" theme="simple"  maxlength="4" size="15" onkeypress="CheckMaskValue(this event);" onchange="CheckMaskFormat(this);"/></td>				
					</tr>
				</table>
			</td>
	</tr>
	<tr>
		<td class="tdLabel"><label class="label">Período Tarde:</label></td>
		<td>
			<table cellspacing="0" cellpadding="0">
				<tr>
					<td><label class="label">Entrada:</label></td>
					<td><label class="label">Saída:</label></td>
				</tr>
				<tr>
					<td><s:textfield key="horaInicioTarde" theme="simple"  maxlength="4" size="15" onkeypress="CheckMaskValue(this event);" onchange="CheckMaskFormat(this);"/></td>
					<td><s:textfield key="horaTerminoTarde" theme="simple"  maxlength="4" size="15" onkeypress="CheckMaskValue(this event);" onchange="CheckMaskFormat(this);"/></td>
				</tr>
			</table>
		</td>
	</tr>

	<s:textfield key="apontamento.solicitadoPor" />
	<s:textfield key="apontamento.aprovadoPor" />
	
	<s:textarea key="apontamento.servicoExecutado" cols="50" rows="10" theme="xhtml" required="true"  />	
	<s:submit  value="Confirmar" targets="ApontarAtividadeDoConsultor" formId="ApontarAtividadeForm" showLoadingText="false"/>
</s:form>

</s:div>