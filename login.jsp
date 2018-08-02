<%@ page contentType="text/html;  charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="announce">
<h3>GEPS &#8211; Gest&atilde;o de Projetos WESS ADVISER </h3>

<s:if test="#session.CONSULTOR_LOGADO == null" >
<%
if(!request.getRequestURI().contains("notLogged.jsp"))
{
%>
<s:include value="mensagens.inc.jsp"/>
<%
}
%>
<h3>Login</h3>

<s:form id="login" action="doLogin" method="post" validate="true" name="LoginForm">
<s:textfield name="login.usuario" label="Usu�rio" required="true" cssStyle="width:110px;" labelposition="top" />
<s:password key="login.senha" label="Senha"  required="true" cssStyle="width:110px;" labelposition="top"/>
<s:submit value="Entrar"/>
</s:form>
</s:if>



<s:if test="#session.CONSULTOR_LOGADO != null" >

	<p class="textright">
		<a href="Consultor!alterarProfile.action"><s:property value="#session.CONSULTOR_LOGADO.nome"/></a>
	</p>
<p class="textright"><a href="doLogout.action">Logout</a></p>
</s:if>


</div>

