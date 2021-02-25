<%@ taglib uri="http://www.springframework.org/tags/form" 
prefix="springform" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/styles.css">
<script src="../js/validarCategoria.js"></script>
</head>
<body>

<jsp:include page="menu.jsp"></jsp:include>

Introduce los datos de la nueva categoria:<br/>
<springform:form method="post" onsubmit="return validar();" action="guardarCategoria" 
commandName="categoria" >
	nombre: <springform:input path="nombre"/><br/>
	<p id="errorN">* El nombre de la categoría debe contener entre 3 y 16 caracteres numéricos o letras, puede contener guiones</p>
	descripcion: <springform:input path="descripcion"/><br/>
	<p id="errorD">* La descripción de categoría debe contener entre 5 y 60 caracteres numéricos o letras, puede contener guiones</p>
	<input type="submit" value="REGISTRAR CATEGORIA"/>	
</springform:form>



</body>
</html>