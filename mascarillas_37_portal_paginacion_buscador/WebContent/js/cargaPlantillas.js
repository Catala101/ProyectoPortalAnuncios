
function cargarPlantillaListadoMascarillas(){
	var contenido = "";
	$.ajax("plantillas-mustache/listadoMascarillas.html",
	{
		async : false ,
		success : function(res){
			contenido = res;
		}
	});
	return contenido;
}

function cargarPlantillaRegistrarMascarilla(){
	var contenido = "";
	$.ajax("plantillas-mustache/registrarMascarilla.html",
	{
		async : false ,
		success : function(res){
			contenido = res;
		}
	});
	return contenido;
}

function cargarPlantillaEditarMascarilla(){
	var contenido = "";
	$.ajax("plantillas-mustache/editarMascarilla.html",
	{
		async : false ,
		success : function(res){
			contenido = res;
		}
	});
	return contenido;
}