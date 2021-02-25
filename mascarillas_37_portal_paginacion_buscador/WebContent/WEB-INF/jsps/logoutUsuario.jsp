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
<!-- Css adicional -->
<link rel="stylesheet" href="css/styles.css">
<style>
@font-face{
		font-family:SheepingDogs;
		src:url(fuentes/SheepingDogs.ttf);
}
@font-face{
		font-family:Roustel;
		src:url(fuentes/Roustel.ttf);
}
</style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>

<div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin: 40px;">
  <strong>Hasta la próxima ${sessionScope.nombre}!</strong> Gracias por entrar en el sistema.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</body>
</html>