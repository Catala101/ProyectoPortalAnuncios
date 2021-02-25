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
<script src="../js/validarUsuario.js"></script>
</head>
<body>

<jsp:include page="menu.jsp"></jsp:include>

Introduce los datos de un Nuevo Usuario:<br/>
<springform:form method="post" onsubmit="return validar();" action="guardarUsuario" 
commandName="usuario" >
	Nombre: <springform:input path="nombre"/><br/>
	<p id="errorN">* El nombre de usuario debe contener entre 3 y 16 caracteres num�ricos o letras, puede contener guiones</p>
	Correo Electr�nico: <springform:input path="email"/><br/>
	<p id="errorM">* El correo no es v�lido, Ejemplo V�lido: ejemplo@gmail.com</p>
	Contrase�a: <springform:input path="pass"/><br/>
	<p id="errorP">* La contrase&ntilde;a debe tener entre 8 y 16 caracteres, al menos un d�gito, al menos una min�scula y al menos una may�scula.</p>
	<input type="submit" value="REGISTRAR USUARIO"/>	
</springform:form>



</body>
</html>