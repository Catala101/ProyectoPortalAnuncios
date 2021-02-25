function validar(){
	var nombre = document.getElementById("nombre").value;
	var email = document.getElementById("email").value;
	var pass = document.getElementById("pass").value;

	var errorN = document.getElementById("errorN");
	var errorM = document.getElementById("errorM");
	var errorP = document.getElementById("errorP");

	var expresionCorreo = /\w+@\w+\.+[a-z]/;
	var expresionContrasena = /^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$/;
	var expresionUsuario = /^[a-zA-ZáéíóúüÁÉÍÓÚÜñÑ0-9_-]{3,16}$/;
	
	//Validación Usuario
		if(nombre === "" || email === "" || pass === ""){
			alert("Todos los campos son obligatorios");
			errorN.style.display = 'block';
			errorN.style.color = 'red';
			errorM.style.display = 'block';
			errorM.style.color = 'red';
			errorP.style.display = 'block';
			errorP.style.color = 'red';
			return false;
		}else if(!expresionUsuario.test(nombre)){
			alert("El nombre de usuario debe contener entre 3 y 16 caracteres numericos o letras, puede contener guiones");
			errorN.style.display = 'block';
			errorN.style.color = 'red';
			return false;
		}else if(email.length>100){
			alert("El correo es demasiado largo");
			return false;
		}else if(!expresionCorreo.test(email)){
			alert("El correo no es valido, Ejemplo Valido: ejemplo@gmail.com");
			errorM.style.display = 'block';
			errorM.style.color = 'red';
			return false;
		}else if(!expresionContrasena.test(pass)){
			alert("La contrase&ntilde;a debe tener entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula y al menos una mayúscula.");
			errorP.style.display = 'block';
			errorP.style.color = 'red';
			return false;
		}

}