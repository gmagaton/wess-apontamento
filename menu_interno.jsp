<%@ page contentType="text/html;  charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<h2 class="hide">Menu:</h2>
<ul>
<s:if test="#session.NIVEL_ACESSO != null && #session.NIVEL_ACESSO == 1 " >
     <li><a href="TipoProjeto!listObjects.action">Tipos de Projetos</a></li>
	 <li><a href="TipoDespesa!listObjects.action">Tipos de Despesas</a></li>
	 <li><a href="TipoHora!listObjects.action">Tipos de Horas</a></li>
	 <li><a href="Atividade!listObjects.action">Atividades</a></li>
	 <li><a href="Empresa!listObjects.action">Empresas</a></li>
	 <li><a href="Projeto!listObjects.action">Projetos</a></li>
	 <li><a href="Cliente!listObjects.action">Clientes</a></li>
	 <li><a href="Consultor!listObjects.action">Consultores</a></li>	 
	 <li><a href="AlocaRecurso.action">Gerenciar Projeto</a></li>
</s:if>
<s:if test="#session.NIVEL_ACESSO != null">
	 <li><a href="Apontamento.action">Apontar Horas</a></li>
	 <li><a href="Despesas.action">Apontar Despesas</a></li>
	 <li><a href="FichaApropriacao.action">FA</a></li>
	 <li><a href="Relatorios.action">Relat&oacute;rios</a></li>
</s:if>	 

</ul>
 