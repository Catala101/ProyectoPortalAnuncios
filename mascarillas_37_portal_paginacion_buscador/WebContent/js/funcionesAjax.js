function listarMascarillas(){
			$.ajax('servicioWebMascarillas/obtenerMascarillas', 
					{
					success: function(data){
							mascarillas = JSON.parse(data);
							//eliminamos el for
							// y decimos que plantilla usar:
							var texto = Mustache.render(listadoMascarillas, mascarillas);
							//por último volcamos el contenido de la plantilla 
							//dentro de contenedor
							$("#contenedor").html(texto);
							
							$(".enlaceBorrar").click(function(){
								alert("Vas a eliminar el anuncio");
								var elemento = $(this); //cojo el elemento para mostrar el id;
								alert("Hiciste click en: " + elemento.html() + ", ID: " + elemento.attr("idp"));
								
								$.ajax("servicioWebMascarillas/borrarMascarilla?id="+elemento.attr("idp") , {
									type : "DELETE",
									success : function(){
										alert("Mascarilla borrada ok en el servidor");
										listarMascarillas();
									}
								});
							});//end click borrar
							$(".enlaceEditar").click(function(){
								alert("Editar elemento de id: " +  $(this).attr("idp"));
								$.ajax("servicioWebMascarillas/obtenerMascarillaPorId?id=" + $(this).attr("idp"), 
									{
										success : function(data){
											alert("Mostrar formulario de edición con la data: " + data);
											//Volcamos el formulario de editar
											$("#contenedor").html(editarMascarilla);
											mascarillaEditar = JSON.parse(data);
											//Volcamos los datos en las casillas del form
											$("#nombre").val(mascarillaEditar.nombre);
											$("#descripcion").val(mascarillaEditar.descripcion);
											$("#fabricante").val(mascarillaEditar.fabricante);
											$("#stock").val(mascarillaEditar.stock);
											$("#precio").val(mascarillaEditar.precio);
											//programamos el botón guardar cambios
											$("form").submit(function(e){
												//volvemos a volcar en base de datos
												mascarillaEditar.nombre = $("#nombre").val();
												mascarillaEditar.descripcion = $("#descripcion").val();
												mascarillaEditar.fabricante = $("#fabricante").val();
												mascarillaEditar.stock = $("#stock").val();
												mascarillaEditar.precio = $("#precio").val();
												json = JSON.stringify(mascarillaEditar);
												alert("Mandar al servicio: " + json);
												$.ajax("servicioWebMascarillas/guardarCambiosMascarilla",{
													
													type : "POST",
													data : "dataEditar="+json,
													success : function(){
														alert("Info enviada al servicio OK");
													}								
												});
											});//end submit
										}
									});
							});//end click eliminar
						}
					}
				);
		}//end listarMascarillas
		
		function registrarMascarilla(){
		//antes de volcar la plantilla de registro tengo que 
		//pedir al servicio web las categorias que hay para formar
		//un desplegable, del cual el usuario debera elegir una categoria
		//para su anuncio
		$.ajax("servicioWebMascarillas/obtenerCategorias",{
			success: function(json){
				alert("formar desplegable con: " + json);
				
				categorias = JSON.parse(json);
				var texto = Mustache.render(registroMascarilla,categorias);
				$("#contenedor").html(texto);
				
				//lo siguiente es cuando se pinche en el boton de registro
				$("form").submit(function(e){
					alert("ejecutamos js para procesar el form");
					//vamos a usar formData
					var form = document.forms[0];
					var formData = new FormData(form);
		
					$.ajax("servicioWebMascarillas/registrarMascarilla",
						{
							type : "POST" , 
							data : formData ,
							cache: false,
							contentType : false,
							processData : false,
							success : function(){
								alert("Mascarilla enviada al servidor correctamente");
							}
						}
					);
		
					e.preventDefault();//para prevenir el envio 
					//de formulario y el refresco de la pagina
				});
				
				
			}
		});
		
	}//end registrarMascarilla