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

Introduce los datos de la categoria a modificar:<br/>
<springform:form method="post" action="guardarCambiosCategoria" 
commandName="categoria" >
	nombre: <springform:input path="nombre"/><br/>
	descripcion: <springform:input path="descripcion"/><br/>
	<springform:hidden path="id"/>
	<input type="submit" value="GUARDAR CAMBIOS"/>	
</springform:form>

</body>
</html>