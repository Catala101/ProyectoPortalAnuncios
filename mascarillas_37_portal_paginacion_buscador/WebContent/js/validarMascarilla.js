function validar(){
	var nombre = document.getElementById("nombre").value;
	var fabricante = document.getElementById("fabricante").value;
	var descripcion = document.getElementById("descripcion").value;
	var stock = document.getElementById("stock").value;
	var precio = document.getElementById("precio").value;

	var errorN = document.getElementById("errorN");
	var errorF = document.getElementById("errorF");
	var errorD = document.getElementById("errorD");
	var errorS = document.getElementById("errorS");
	var errorP = document.getElementById("errorP");

	var expresionNombre = /^[a-z0-9_-]{3,16}$/;
	var expresionFabricante = /[a-zA-Z áéíóúüÁÉÍÓÚÜñÑ]{3,20}/;
	var expresionStock = /^[0-9]{1,2}$/;
	var expresionPrecio = /^[0-9]+([.][0-9]+)?$/;
	
	//Validación Usuario
		if(nombre === "" || fabricante === "" || descripcion === "" || stock === "" || precio === ""){
			alert("ERROR: Todos los campos son obligatorios");
			errorN.style.display = 'block';
			errorN.style.color = 'red';
			errorF.style.display = 'block';
			errorF.style.color = 'red';
			errorD.style.display = 'block';
			errorD.style.color = 'red';
			errorS.style.display = 'block';
			errorS.style.color = 'red';
			errorP.style.display = 'block';
			errorP.style.color = 'red';
			return false;
		}else if(!expresionNombre.test(nombre)){
			alert("El nombre de usuario debe contener entre 3 y 16 caracteres numericos o letras, puede contener guiones");
			errorN.style.display = 'block';
			errorN.style.color = 'red';
			return false;
		}else if(expresionNombre.test(nombre)){
			errorN.style.display = 'none';
		}else if(!expresionFabricante.test(fabricante)){
			alert("El fabricante debe tener entre 2 y 20 caracteres");
			errorF.style.display = 'block';
			errorF.style.color = 'red';
			return false;
		}else if(expresionFabricante.test(fabricante)){
			errorF.style.display = 'none';
		}else if(descripcion === ""){
			alert("La descripcion no puede estar vacía");
			errorD.style.display = 'block';
			errorD.style.color = 'red';
			return false;
		}else if(!expresionStock.test(stock)){
			alert("El Stock solo permite número del 0 al 9 con límite de 100");
			errorS.style.display = 'block';
			errorS.style.color = 'red';
			return false;
		}else if(!expresionPrecio.test(precio)){
			alert("El precio debe tener numeros del 0 al 9 separado por comas");
			errorP.style.display = 'block';
			errorP.style.color = 'red';
			return false;
		}

}