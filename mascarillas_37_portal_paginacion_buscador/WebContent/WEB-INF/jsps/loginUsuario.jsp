<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
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

<div class="animate__animated animate__fadeInRight alert alert-danger" role="alert" style="margin-top: 15px; margin-left:70px; margin-right:70px;">
  <c:if test="${sessionScope.nombre == null}">
			Lo siento no estás identificado. ${mensaje}
  </c:if>
</div>

<!--  <form method="post" action="indentificarUsuario">
	Email: <input type="text" name="email"><br>
	Contraseña: <input type="password" name="pass"><br>
	<input type="submit" value="ENTRAR"><br>
</form>
-->
<form method="post" action="indentificarUsuario" style="margin-left:70px; margin-right:70px; margin-bottom:220px; padding:20px; border: 2px solid orange; border-radius: 15px 15px 15px 15px; background-color: rgba(0,0,0,0.8);" class="px-4 py-3">
	<h3 class="logTitle" style="font-family: SheepingDogs; margin-left:20px; text-align:center; color: orange;">Introduce los credenciales para Entrar</h3><br>
    <div class="form-group">
      <label for="exampleDropdownFormEmail1" style="color:white;">Correo Electrónico</label>
      <input type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com" name="email">
    </div>
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
  
<footer>
      <div class="contenedor-footer-all">
        <div class="contenedor-body">
            <div class="colum1">
                <h1 class="info">Más información</h1>
                <p>Si quiere saber más de nosotros visite y síganos en nuestras redes sociales y no dude en contactar con nosotros.</p>
            </div>
            <div class="colum2">
                <h1 class="info">Redes Sociales</h1>
                <div class="row1">
                    <a href="..." target="_blank" class="Telegram" title="Red social Telegaram (página de la cuenta de Instagram)"><img src="fotos/SocialMediaIcons/PNG/CircleBlackWhite/Instagram.png" alt="Imagen de la red social Telegram Footer" title="Red Social 1" /></a>
                    <label>Siguenos en Istagram<label> 
                </div>
                <div class="row1">
                    <a href="..." target="_blank" class="WhatsApp" title="Red social WhatsApp (página de la cuenta de WhatsApp)"><img src="fotos/SocialMediaIcons/PNG/CircleBlackWhite/WhatsApp.png" alt="Imagen de la red social WhatsApp Footer" title="Red Social 2" /></a>
                    <label>Siguenos en WhatsApp<label> 
                </div>
                <div class="row1">
                    <a href="..." target="_blank" class="facebook" title="Red social Telegaram (página de la cuenta de Youtube)"><img src="fotos/SocialMediaIcons/PNG/CircleBlackWhite/YouTube.png" alt="Imagen de la red social Facebook Footer" title="Red Social 3" /></a>
                    <label>Siguenos en Facebook<label> 
                </div>
            </div>
            <div class="colum3">
                <h1 class="info">Información de Contacto</h1>
                <div class="row2">
                    <img src="fotos/SocialMediaIcons/PNG/CircleBlackWhite/Google+.png" alt="Imagen de gmail Footer" title="Red Social 5" />
                    <label>ejemplo@gmail.com</label>
                </div>
            </div>
        </div>
        <div class="contenedor-footer">
            <div class="footer">
                <div class="copyright">
                    © 2020  Todos los Derechos Reservados. | <a href="index.html" title="Redirección a página de inicio" style="font-family: SheepingDogs; font-size: 15px; letter-spacing: 0.09em;">Portal de Anuncios de Mascarillas</a>
                </div>
                <div class="informacion">
                    <a href="">Información Comapañía</a> | <a href="https://es.wikipedia.org/wiki/Pol%C3%ADtica_de_privacidad">Privacidad y Política</a> | <a href="https://policies.google.com/terms?hl=es">Terminos y Condiciones</a>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>