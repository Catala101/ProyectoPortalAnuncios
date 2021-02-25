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

<div style="text-align: center;">
		total de resultados: ${total} <br/>
		
		<c:if test="${ anterior >= 0 }">
			<a href="listarAnuncios?comienzo=${anterior}&nombre=${nombre}">ANTERIOR</a>
		</c:if>
		
		<c:if test="${ siguiente < total }">
			<a href="listarAnuncios?comienzo=${siguiente}&nombre=${nombre}">SIGUIENTE</a>
		</c:if>
</div>
Mostrar listado de mascarillas con opcion de borrar y editar<br>

Listado de anuncios para administrador: <br/>
<c:forEach var="mascarilla" items="${mascarillas}" >
	
		<div style="margin: 5px; background-color: orange; padding: 10px;">
			<%--saco con etiquetas jslt la información que quiero mostrar --%>
			<img src="subidas/${mascarilla.id}.jpg" style="height:90px; weight:90px;"/><br>
			Usuario: <b>${mascarilla.usuario.nombre}</b><br/>
			Nombre: ${mascarilla.nombre}<br/>
			Descripcion: ${mascarilla.descripcion}<br/>
			Fabricante: ${mascarilla.fabricante}<br/>
			Stock: ${mascarilla.stock}<br/>
			Precio: ${mascarilla.precio}<br/>
			Categoría
			<c:if test="${mascarilla.categorias!=null}">
	    			 ${mascarilla.categorias[0].nombre}
	    		</c:if>
	    		<c:if test="${mascarilla.categorias.size()==0}">
	    			Sin Categoria
	    		</c:if>	
			<br/>
			<a onclick="return confirm('¿Estas seguro?')" href="borrarMascarilla?id=${mascarilla.id}">Borrar Mascarilla</a> 
			<a href="editarMascarilla?id=${mascarilla.id}">Editar Mascarilla</a>
		</div>
		
</c:forEach>
</body>
</html>