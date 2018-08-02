<%@ page contentType="text/html;  charset=UTF-8"  %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:head theme="ajax"/>

<s:div id="ApontarDespesasAoProjeto">
<s:include value="../mensagens.inc.jsp"/>
<s:form
	id="ApontarDespesaProjetoForm"
	name="ApontarDespesaProjetoForm"
	method="post"
	action="ApontarDespesaProjeto"	
	validate="true"
	theme="ajax">
	<tr>
		<td colspan="2"><h3>Apontar despesa ao Projeto</h3></td>
	</tr>
	<tr>
	    <td colspan="2">
	        <fieldset>
	            <legend>Despesas Reembolsáveis</legend>
	            <s:property value="despesa.projetos.descricaoDespesas"/>
            </fieldset>
	    </td>
	</tr>
	    	<s:hidden name="despesa.projetos.projetoId"></s:hidden>
            <s:hidden name="despesa.despesaProjetoId"></s:hidden>
            <s:select key="despesa.consultores.consultorId"
                      list="consultores"
                      listKey="consultorId"
                      listValue="nome"
                      required="true"
                      headerKey="-1"
                      headerValue="-- Selecione o Consultor --"/>
            <s:select key="despesa.tiposDespesas.tipoDespesaId"
                      list="tiposDespesas"
                      listKey="tipoDespesaId"
                      listValue="descricao"
                      required="true"
                      headerKey="-1"
                      headerValue="-- Selecione o tipo da despesa --"/>

            <s:textfield key="despesa.quantidade" maxlength="10" value="%{quantidade}" tooltip="Utilize v�rgula (,) para separar as casas decimais." />
            <s:textfield key="despesa.valorTotal" required="true" maxlength="10" value="%{valorTotal}" tooltip="Utilize v�rgula (,) para separar as casas decimais."/>
            <s:datetimepicker key="despesa.dataDespesa" required="true" language="pt_BR" displayFormat="dd/MM/yyyy"/>
            <s:submit  value="Confirmar" targets="ApontarDespesasAoProjeto" formId="ApontarDespesaProjetoForm" showLoadingText="false"/>
</s:form>



</s:div>