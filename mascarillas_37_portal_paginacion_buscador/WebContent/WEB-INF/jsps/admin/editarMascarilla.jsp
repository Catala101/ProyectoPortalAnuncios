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
Actualice los datos de la Mascarilla:
<springform:form method="post" action="guardarCambiosMascarilla" 
commandName="mascarilla" >
	nombre: <springform:input path="nombre"/>
	<span style="color: red"> <springform:errors path="nombre" /> </span>
	<br/>
	
	descripcion: <springform:input path="descripcion"/> 
	<span style="color: red"> <springform:errors path="descripcion" /> </span>
	<br/>
	
	fabricante: <springform:input path="fabricante"/> <br/>
	
	stock: <springform:input path="stock"/> <br/>
	
	precio: <springform:input path="precio"/> <br/>
	
	<springform:hidden path="id"/>
	
	<springform:hidden path="usuario.id"/>
	
	<input type="submit" value="GUARDAR CAMBIOS MASCARILLA">
	
</springform:form>
</body>
</html>