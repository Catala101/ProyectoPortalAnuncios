package controladores;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@Controller
public class ControladorMisAnuncios {

	@RequestMapping("misAnuncios")
	public String misAnuncios(HttpServletRequest request, Model model) {
		if(request.getSession().getAttribute("idUsuario") != null) {
			System.out.println("Ofrecer la aplicación de js de gestión de Anuncios");
			return "misAnuncios/index";
		}else {
			model.addAttribute("mensaje", "Debes identificarte para acceder en mis anuncios");
			return "loginUsuario";
		}
		
	}
}
