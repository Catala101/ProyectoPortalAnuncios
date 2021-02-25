<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="imagenes/fondo.jpg" alt="First slide" style="height: 800px;">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="imagenes/mascarilla1.jpg" alt="Second slide" style="height: 800px;">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="imagenes/mascarilla2.png" alt="Third slide" style="height: 800px;">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

	<c:if test="${sessionScope.nombre != null}">
		<div class="alert alert-success" role="alert">
			Hola <b>${sessionScope.nombre}</b>, estás identificado
		</div>
	</c:if>


	<c:if test="${sessionScope.nombre == null}">
		<div class="alert alert-warning" role="alert">
			Lo siento no estás identificado
		</div>
	</c:if>


<br/>
<div class="box">
      <div class="container-4">
      	<form action="listarMascarillas">
        	<input type="search" id="search" name="nombre" value="${nombre}" placeholder="Buscar..." />
        	<button class="icon" type="submit"><i class="fa fa-search"></i></button>
        </form>
      </div>
</div>


<h4 class="anuncios" style="" >Listado de anuncios: </h4><br/>
<div class="album py-5 bg-light">
    <div class="container">
      <div class="row">
<c:forEach var="mascarilla" items="${mascarillas}" >
	
		<!-- <div style="margin: 5px; background-color: orange; padding: 10px;">
			<%--saco con etiquetas jslt la información que quiero mostrar --%>
			<img src="subidas/${mascarilla.id}.jpg" style="height:90px; weight:90px;"/><br>
			usuario: <b>${mascarilla.usuario.nombre}</b><br/>
			nombre: ${mascarilla.nombre}<br/>
			descripcion: ${mascarilla.descripcion}<br/>
			fabricante: ${mascarilla.fabricante}<br/>
			stock: ${mascarilla.stock}<br/>
			precio: ${mascarilla.precio}<br/>
		</div>-->
		<div class="col-md-4" >
          <div class="card mb-4 shadow-sm" style="border: 2px solid orange">
            <img src="subidas/${mascarilla.id}.jpg" width="100%" height="280" class="card-img-top" alt="Imagen del Producto">
            <div class="card-body">
            <p class="card-title"><b>Mascarilla: ${mascarilla.nombre}</b></p>
            <p class="card-text">${mascarilla.descripcion}</p>
              <ul class="list-group list-group-flush">
              	<li class="list-group-item"><b>Fabricante:</b> ${mascarilla.fabricante}</li>
	    		<li class="list-group-item"><b>Precio:</b> ${mascarilla.precio}&euro;</li>
	    		<li class="list-group-item"><b>Categoria:</b>
	    		<c:if test="${mascarilla.categorias!=null}">
	    			 ${mascarilla.categorias[0].nombre}
	    		</c:if>
	    		<c:if test="${mascarilla.categorias.size()==0}">
	    			Sin Categoria
	    		</c:if>
	    		</li>
	  		  </ul>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
	                <ul class="list-group list-group-flush">
	                	<li class="list-group-item"><b>Usuario:</b> ${mascarilla.usuario.nombre}</li>
	                </ul>
                </div>
                <medium class="text-muted">Stock: ${mascarilla.stock}</medium>
              </div>
            </div>
          </div>
        </div>
</c:forEach>
		</div>
	</div>
	<div style="text-align: center;">
		total de resultados: ${total} <br/>
		
		<c:if test="${ anterior >= 0 }">
			<a href="listarMascarillas?comienzo=${anterior}&nombre=${nombre}">ANTERIOR</a>
		</c:if>
		
		<c:if test="${ siguiente < total }">
			<a href="listarMascarillas?comienzo=${siguiente}&nombre=${nombre}">SIGUIENTE</a>
		</c:if>
	</div>
</div>
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





