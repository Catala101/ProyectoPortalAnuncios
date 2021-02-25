<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<!-- Animaciones-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
</head>
<body>

<jsp:include page="menu.jsp"></jsp:include>
<div class="animate__animated animate__fadeInRight alert alert-success" role="alert" style="margin: 40px;">
  		<h4 class="alert-heading">Bienvenido Administrador</h4>
  		<p>Ya puedes acceder a gestión de Usuarios, Categorías, y Mascarillas</p>
  		<hr>
  		<p class="mb-0">Asegúrate de cerrar sesión cuando termines.</p>
</div>
</body>
</html>