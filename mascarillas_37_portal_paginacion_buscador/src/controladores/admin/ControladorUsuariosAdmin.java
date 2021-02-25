package controladores.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import modelo.Categoria;
import modelo.Usuario;
import servicios.ServicioUsuarios;

@Controller
@RequestMapping("admin/")
public class ControladorUsuariosAdmin {
	@Autowired
	private ServicioUsuarios servicioUsuarios;
	
	@RequestMapping("registrarUsuario")
	public String registrarUsuario(Model model) {
		model.addAttribute("usuario",new Usuario());
		return "admin/registrarUsuario";
	}
	@RequestMapping("guardarUsuario")
	public String guardarUsuario(Usuario usuario, Model model) {
		servicioUsuarios.registrarUsuario(usuario);
		return listarUsuarios(model);		
	}
	@RequestMapping("listarUsuarios")
	public String listarUsuarios(Model model) {
		model.addAttribute("usuarios",servicioUsuarios.obtenerUsuarios());
		return "admin/listadoUsuarios";
	}
	@RequestMapping("borrarUsuario")
	public String borrarUsuario(String id,Model model) {
		servicioUsuarios.borrarUsuario(Integer.parseInt(id));
		return listarUsuarios(model);
	}
	@RequestMapping("editarUsuario")
	public String editarUsuario(String id,Model model) {
		Usuario u = servicioUsuarios.obtenerUsuarioPorId(Integer.parseInt(id));
		model.addAttribute("usuario", u);
		return "admin/editarUsuario";
	}
	@RequestMapping("guardarCambiosUsuario")
	public String guardarCambiosUsuario(Usuario usuario, Model model) {
		System.out.println("Actualizar datos del Usuario: " + usuario.toString());
		servicioUsuarios.guardarCambiosUsuario(usuario);
		return listarUsuarios(model);
	}
}
