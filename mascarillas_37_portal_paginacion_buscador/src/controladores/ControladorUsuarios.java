package controladores;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import modelo.Usuario;
import servicios.ServicioUsuarios;

@Controller
public class ControladorUsuarios {
	
	@Autowired
	private ServicioUsuarios servicioUsuarios;
	
	@RequestMapping("registrarUsuario")
	public String registrarUsuario(Model model) {
		model.addAttribute("nuevoUsuario", new Usuario());
		return "registrarUsuario";
	}
	@RequestMapping("guardarNuevoUsuario")
	public String guardarNuevoUsuario(Usuario nuevoUsuario) {
		servicioUsuarios.registrarUsuario(nuevoUsuario);
		return "registroUsuarioOK";
	}
	@RequestMapping("loginUsuario")
	public String loginUsuario() {
		return "loginUsuario";
	}
	@RequestMapping("indentificarUsuario")
	public String indentificarUsuario(String email, String pass, Model model, HttpServletRequest request) {
		Usuario u = servicioUsuarios.obtenerUsuarioPorEmailYPass(email, pass);
		if (u != null) {
			System.out.println("Usuario identificado correctamente");
			request.getSession().setAttribute("idUsuario", u.getId());
			request.getSession().setAttribute("nombre", u.getNombre());
			return "loginOK";
		}else {
			model.addAttribute("mensaje", "Email o Contraseña introducida incorrecta");
			return "loginUsuario";
		}
	}
	@RequestMapping("logoutUsuario")
	public String logoutUsuario(HttpServletRequest request) {
		
		request.getSession().invalidate();
		return "logoutUsuario";
		
	}
	
}//end ControladorUsuarios
