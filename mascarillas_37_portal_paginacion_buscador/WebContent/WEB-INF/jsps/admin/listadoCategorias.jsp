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

<a href="registrarCategoria">Crear nueva categoria</a><br/>

Listado de categorias para administrador: <br/>
<c:forEach var="cat" items="${categorias}" >
	<div style="margin: 5px">
		nombre: ${cat.nombre}
		<a onclick="return confirm('¿Estas seguro?')" href="borrarCategoria?id=${cat.id}">borrar categoria</a> 
		<a href="editarCategoria?id=${cat.id}">editar categoria</a> 		
	</div>
</c:forEach>

</body>
</html>