<%@ taglib uri="http://www.springframework.org/tags/form" 
prefix="springform" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="menu.jsp"></jsp:include>

Introduce los datos del Usuario a modificar:<br/>
<springform:form method="post" action="guardarCambiosUsuario" 
commandName="usuario" >
	Nombre: <springform:input path="nombre"/><br/>
	Dirección de Correo: <springform:input path="email"/><br/>
	Contraseña: <springform:input path="pass"/><br/>
	<springform:hidden path="id"/>
	<input type="submit" value="GUARDAR CAMBIOS"/>	
</springform:form>

</body>
</html>