<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pagina de Mascarillas</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script type="text/javascript" src="jsExterno/jquery.js"></script>
<!-- Animaciones-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
<!-- Css adicional -->
<link rel="stylesheet" href="../css/styles.css">
<style>
@font-face{
		font-family:SheepingDogs;
		src:url(../fuentes/SheepingDogs.ttf);
}
@font-face{
		font-family:Roustel;
		src:url(../fuentes/Roustel.ttf);
}
</style>
</head>
<body>

<div style="color: red">${mensaje}</div>

<!--  <form action="identificarAdmin" method="post">
pass: <input type="password" name="pass"/><br/>
<input type="submit" value="ENTRAR"/>
</form>-->
<jsp:include page="menu.jsp"></jsp:include>

<form method="post" action="identificarAdmin" style="margin-left:70px; margin-right:70px; padding:20px; border: 2px solid orange; border-radius: 15px 15px 15px 15px; background-color: rgba(0,0,0,0.8);" class="animate__animated animate__pulse px-4 py-3">
	<h3 style="margin-left:20px; text-align:center;color:orange; font-family: SheepingDogs;">Acceder como Administrador</h3><br>
    <div class="form-group">
      <label for="exampleDropdownFormPassword1" style="color:white;">Contraseña</label>
      <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password" name="pass">
    </div>
    <div class="form-group">
      <div class="form-check">
        <input type="checkbox" class="form-check-input" id="dropdownCheck">
        <label class="form-check-label" for="dropdownCheck" style="color:white;">
          Recordar Usuario
        </label>
      </div>
    </div>
    <input type="submit" class="btn btn-warning" style="color:white;" value="ACCEDER"></input>
  </form>

</body>
</html>