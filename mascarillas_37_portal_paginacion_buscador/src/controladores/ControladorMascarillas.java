package controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import servicios.ServicioMascarillas;

@Controller
public class ControladorMascarillas {
		
		
		@Autowired
		private ServicioMascarillas servicioMascarillas;
		
		 @RequestMapping("listarMascarillas")
		 public String listarMascarillas(Model model, String nombre, Integer comienzo) {
			System.out.println("Mostrar las mascarillas con el nombre " + nombre);
			
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
			return "listadoMascarillas";
			 
		 }
	
}
