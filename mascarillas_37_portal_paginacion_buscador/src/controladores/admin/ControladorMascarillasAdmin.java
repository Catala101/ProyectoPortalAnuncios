package controladores.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import modelo.Mascarilla;
import servicios.ServicioMascarillas;

@Controller
@RequestMapping("admin/")
public class ControladorMascarillasAdmin {

	@Autowired
	private ServicioMascarillas servicioMascarillas;
	
	@RequestMapping("listarAnuncios")
	public String listarAnuncios(Model model, String nombre, Integer comienzo) {
		
		String nombreAbuscar= ""; //Vacío dará todos los libros.
		
		if (nombre != null) {
			nombreAbuscar = nombre;
		}
		
		int comienzoInt = 0;
		if(comienzo != null) {
			comienzoInt = comienzo.intValue();
		}
		System.out.println("Mostrar mascarillas desde el resulado: " + comienzoInt);
		
		int siguiente = comienzoInt + 6;
		int anterior = comienzoInt - 6;
		
		model.addAttribute("mascarillas", servicioMascarillas.obtenerMascarillas(nombreAbuscar, comienzoInt));
		model.addAttribute("nombre", nombreAbuscar); //le devuelvo el título buscado a la jsp para mostrar lo que he buscado
		model.addAttribute("siguiente", siguiente);
		model.addAttribute("anterior", anterior);
		model.addAttribute("total", servicioMascarillas.obtenerTotalMascarillas(nombreAbuscar));
		return "admin/listadoMascarillas";
	}
	@RequestMapping("borrarMascarilla")
	public String borrarMascarilla(String id,Model model) {
		servicioMascarillas.borrarMascarilla(Integer.parseInt(id));
		return listarAnuncios(model, id, null);
	}
	@RequestMapping("editarMascarilla")
	public String editarMascarilla(String id,Model model) {
		Mascarilla m = servicioMascarillas.obtenerMascarillaPorId(Integer.parseInt(id));
		model.addAttribute("mascarilla", m);
		return "admin/editarMascarilla";
	}
	@RequestMapping("guardarCambiosMascarilla")
	public String guardarCambiosMascarilla(Mascarilla mascarilla,Model model) {
		System.out.println("Actualizar datos de la mascarilla: " + mascarilla.toString());
		System.out.println("Que tiene como id de usuario: " + mascarilla.getUsuario());
		servicioMascarillas.guardarCambiosMascarilla(mascarilla, mascarilla.getUsuario().getId());
		return listarAnuncios(model, null, null);
	}
}
