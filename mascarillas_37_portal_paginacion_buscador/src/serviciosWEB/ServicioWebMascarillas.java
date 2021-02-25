package serviciosWEB;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.gson.Gson;
import modelo.Mascarilla;
import servicios.ServicioCategorias;
import servicios.ServicioMascarillas;
import utilidadesArchivo.GestorArchivos;

//Servlet de cliente mandaba y recibía json al servidor (JSON)

@Controller
public class ServicioWebMascarillas {

	@Autowired
	private ServicioMascarillas servicioMascarillas;
	
	@Autowired
	private ServicioCategorias servicioCategorias;
	
	
	@RequestMapping("servicioWebMascarillas/obtenerCategorias")
	public ResponseEntity<String> obtenerCategorias(){
		String json = "";
		//formar el json con las categorias
		json = new Gson().toJson(servicioCategorias.obtenerCategoriasParaListado());
		return new ResponseEntity<String>(json,HttpStatus.OK);
	}
	
	@RequestMapping("servicioWebMascarillas/registrarMascarilla")
	public ResponseEntity<String> registrarMascarilla(
			@RequestParam Map<String, Object> formulario,
			@RequestParam("portada") CommonsMultipartFile portada,
			HttpServletRequest request){
		Mascarilla m = new Mascarilla();
		m.setNombre(formulario.get("nombre").toString());
		m.setDescripcion(formulario.get("descripcion").toString());
		m.setFabricante(formulario.get("fabricante").toString());
		m.setStock(Integer.parseInt(formulario.get("stock").toString()));
		m.setPrecio(Double.parseDouble(formulario.get("precio").toString()));
		
		System.out.println("Id de la categoría recibida: " + formulario.get("inputGroupSelect04"));
		
		int idUsuario = (int)request.getSession().getAttribute("idUsuario");
		int idCategoria = Integer.parseInt(formulario.get("inputGroupSelect04").toString());
		servicioMascarillas.registrarMascarilla(m,idUsuario,idCategoria);
		//ahora despues de registrar la mascarilla, el objeto m tiene la id asignada
		
		System.out.println("Ahora queda guardar la portada: " + portada.getOriginalFilename());
		
		// Incluimos HttpServletRequest para saber la ruta del proyecto
		String rutaRealDelProyecto = request.getServletContext().getRealPath("");
		System.out.println("Este proyecto se está ejecutando en: " + rutaRealDelProyecto);
		m.setPortada(portada);
		//ahora mismo l tiene la portada y la id del registro que se ha hecho
				GestorArchivos.guardarPortadaMascarilla(m, rutaRealDelProyecto);
		
		return new ResponseEntity<String>("",HttpStatus.OK);
	}
	
	@RequestMapping("servicioWebMascarillas/obtenerMascarillas")
	public ResponseEntity<String> obtenerMascarilla(HttpServletRequest request){
		String json = new Gson().toJson(servicioMascarillas.obtenerMascarillasParaListado((int) request.getSession().getAttribute("idUsuario")));
		return new ResponseEntity<String>(json,HttpStatus.OK);
	}
	
	@RequestMapping("servicioWebMascarillas/borrarMascarilla")
	public ResponseEntity<String> borrarMascarilla(@RequestParam("id") int id){
		servicioMascarillas.borrarMascarilla(id);
		return new ResponseEntity<String>("",HttpStatus.OK);
	}
	
	@RequestMapping("servicioWebMascarillas/obtenerMascarillaPorId")
	public ResponseEntity<String> obtenerMascarillaPorId(@RequestParam("id") int id){
		String json = new Gson().toJson(servicioMascarillas.obtenerMascarillaParaEditar(id));
		return new ResponseEntity<String>(json,HttpStatus.OK);
	}

	@RequestMapping("servicioWebMascarillas/guardarCambiosMascarilla")
	public ResponseEntity<String> guardarCambiosMascarilla(
			@RequestParam("dataEditar") String json, HttpServletRequest request){
		Mascarilla m = new Gson().fromJson(json, Mascarilla.class);
		servicioMascarillas.guardarCambiosMascarilla(m, (int)request.getSession().getAttribute("idUsuario"));
		return new ResponseEntity<String>("",HttpStatus.OK);
	}
}
