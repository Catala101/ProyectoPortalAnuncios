<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="text-align:center;font-size: 2em;background-color: black;color: orange;">
<div class="animate__animated animate__bounceInRight titulo">PORTAL DE ANUNCIOS DE MASCARILLAS</div>
</div>
<nav class="site-header sticky-top py-1" style="background-color: black;">
  <div class="container d-flex flex-column flex-md-row justify-content-between" >
    <a class=" animate__animated animate__rotateIn py-2" href="#" aria-label="Product">
      <img src="imagenes/mascarilla-medica2.png" width="44" height="44" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="d-block mx-auto" role="img" viewBox="0 0 24 24" focusable="false"/><title>Product</title><circle cx="12" cy="12" r="10"/><path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94"/>
    </a>
    <a class="animate__animated animate__fadeInUp animate__delay-800ms py-2 d-none d-md-inline-block" href="listarMascarillas" style="text-decoration:none; color: orange; margin-top: 5px;">Inicio</a>
    <a class="animate__animated animate__fadeInUp animate__delay-900ms py-2 d-none d-md-inline-block" href="misAnuncios" style="text-decoration:none; color: orange; margin-top: 5px;">Mis anuncios</a>
    <c:if test="${sessionScope.idUsuario == null}">
	<a class="animate__animated animate__fadeInUp animate__delay-1100ms py-2 d-none d-md-inline-block" href="registrarUsuario" style="text-decoration:none; color: orange; margin-top: 5px;">Registrarme</a>
	<a class="animate__animated animate__fadeInUp animate__delay-5000ms py-2 d-none d-md-inline-block" href="loginUsuario" style="text-decoration:none; color: orange; margin-top: 5px;">Identificarme</a>
	</c:if>
    <c:if test="${sessionScope.idUsuario != null}">
	<a class="animate__animated animate__fadeInUp animate__delay-1300ms py-2 d-none d-md-inline-block" href="logoutUsuario" style="text-decoration:none; color: orange; margin-top: 5px;">Cerrar Sesión</a>
	</c:if>
  </div>
</nav>
<nav class="site-header2 sticky-top py-1 submenu">
	<div class="container d-flex flex-column flex-md-row justify-content-between" >
	    <a class="py-2 d-md-inline-block fuente2" href="listarMascarillas" style="text-decoration:none; color: orange; margin-top: 5px;">Inicio</a>
	    <a class="py-2 d-md-inline-block fuente2" href="misAnuncios" style="text-decoration:none; color: orange; margin-top: 5px;">Mis Anuncios</a>
	    <c:if test="${sessionScope.idUsuario == null}">
		<a class="py-2 d-md-inline-block fuente2" href="registrarUsuario" style="text-decoration:none; color: orange; margin-top: 5px;">Registrarme</a>
		<a class="py-2 d-md-inline-block fuente2" href="loginUsuario" style="text-decoration:none; color: orange; margin-top: 5px;">Identificarme</a>
		</c:if>
	    <c:if test="${sessionScope.idUsuario != null}">
		<a class="submenuE py-2 d-md-inline-block fuente2" href="logoutUsuario" style="text-decoration:none; color: orange; margin-top: 5px;">Cerrar Sesión</a>
		</c:if>
  	</div>
 </nav>