<%@ taglib uri="http://www.springframework.org/tags/form" 
prefix="springform" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

Introduce los datos de la mascarilla que vas a vender:<br/>
<springform:form method="post" action="guardarNuevaMascarilla" 
commandName="nuevaMascarilla">
	nombre: <springform:input path="nombre"/>
	<span style="color: red"> <springform:errors path="nombre" /> </span>
	<br/>
	
	descripcion: <springform:input path="descripcion"/> 
	<span style="color: red"> <springform:errors path="descripcion" /> </span>
	<br/>
	
	fabricante: <springform:input path="fabricante"/> <br/>
	
	stock: <springform:input path="stock"/> <br/>
	
	precio: <springform:input path="precio"/> <br/>
	
	<input type="submit" value="REGISTRAR MI ANUNCIO">

</springform:form>


</body>
</html>