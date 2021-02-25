<%@ taglib uri="http://www.springframework.org/tags/form" 
prefix="springform" %>
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
<script src="js/validarUsuario.js"></script>
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
	<!--<springform:form method="post" commandName="nuevoUsuario" action="guardarNuevoUsuario">
		nombre: <springform:input path="nombre"></springform:input><br>
		email: <springform:input type="email" path="email"></springform:input><br>
		Contraseña: <springform:input type="password" path="pass"></springform:input><br>
		<input type="submit" value="Registrar">
		
	</springform:form>-->
	<div class="animate__animated animate__fadeInRight alert alert-warning" role="alert" style="margin-top: 15px; margin-left:70px; margin-right:70px;">
  		Introduza nombre, correo y contraseña para poder crear un nuevo Usuario y acceder a la gestión de mascarillas
	</div>
	<form method="post"commandName="nuevoUsuario" style="margin-top:20px; margin-bottom: 220px; margin-left:70px; margin-right:70px; padding:20px; border: 2px solid black; border-radius: 15px 15px 15px 15px; background-color: orange;" class="px-4 py-3" onsubmit="return validar();" action="guardarNuevoUsuario">
		<h3 style="margin-left:20px; text-align:center; color:black; font-family: SheepingDogs;">Introduce los datos para registrar:</h3><br>
	    <div class="form-group">
	      <label for="nombre" style="color:white;">Nombre</label>
	      <input type="text" class="form-control" id="nombre" placeholder="Alfredo" name="nombre">
	      <p id="errorN" class="formulario__input-error">* El nombre de usuario debe contener entre 3 y 16 caracteres numéricos o letras, puede contener guiones</p>
	    </div>
	    <div class="form-group">
	      <label for="email" style="color:white;">Correo Electrónico</label>
	      <input type="text" class="form-control" id="email" placeholder="email@example.com" name="email">
	      <p id="errorM" class="formulario__input-error">* El correo no es válido, Ejemplo Válido: ejemplo@gmail.com</p>
	    </div>
	    <div class="form-group">
	      <label for="pass" style="color:white;">Contraseña</label>
	      <input type="password" class="form-control" id="pass" placeholder="Password" name="pass">
	      <p id="errorP" class="formulario__input-error">* La contrase&ntilde;a debe tener entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula y al menos una mayúscula.</p>
	    </div>
	    <input type="submit" class="btn btn-warning" style="color:white; background-color:black;" value="REGISTRAR"></input>
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