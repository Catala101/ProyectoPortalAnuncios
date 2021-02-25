<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

Listado de Usuarios para administrador: <br/>
<a href="registrarUsuario">Registrar un Nuevo Usuario</a><br>
<c:forEach var="usuario" items="${usuarios}" >
	
		<div style="margin: 5px; background-color: orange; padding: 10px;">
			<%--saco con etiquetas jslt la información que quiero mostrar --%>
			Nombre de Usuario: <b>${usuario.email}</b><br/>
			Email: ${usuario.nombre}<br/>
			Contraseña: ${usuario.pass}<br/>
			<a onclick="return confirm('¿Estas seguro?')" href="borrarUsuario?id=${usuario.id}">Borrar Usuario</a> 
			<a href="editarUsuario?id=${usuario.id}">Editar Usuario</a>
		</div>
		
</c:forEach>
</body>
</html>