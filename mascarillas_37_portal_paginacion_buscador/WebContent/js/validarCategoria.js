function validar(){
	var nombre = document.getElementById("nombre").value;
	var descripcion = document.getElementById("descripcion").value;

	var errorN = document.getElementById("errorN");
	var errorD = document.getElementById("errorD");

	var expresionDescripcion = /^[a-z0-9_-]{5,60}$/;
	var expresionNombre = /^[a-z0-9_-]{3,16}$/;
	
	//Validación Usuario
		if(nombre === "" || descripcion === ""){
			alert("Todos los campos son obligatorios");
			errorN.style.display = 'block';
			errorN.style.color = 'red';
			errorD.style.display = 'block';
			errorD.style.color = 'red';
			return false;
		}else if(!expresionNombre.test(nombre)){
			alert("El nombre de la categoría debe contener entre 3 y 16 caracteres numericos o letras, puede contener guiones");
			errorN.style.display = 'block';
			errorN.style.color = 'red';
			return false;
		}else if(!expresionDescripcion.test(descripcion)){
			alert("El nombre de usuario debe contener entre 5 y 60 caracteres numericos o letras, puede contener guiones");
			errorD.style.display = 'block';
			errorD.style.color = 'red';
			return false;
		}

}