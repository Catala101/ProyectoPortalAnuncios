package controladores.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import modelo.Categoria;
import modelo.Mascarilla;
import servicios.ServicioCategorias;

@Controller
@RequestMapping("admin/")
public class ControladorCategoriasAdmin {
	
	@Autowired
	private ServicioCategorias servicioCategorias;
	
	@RequestMapping("listarCategorias")
	public String listarCategorias(Model model) {
		model.addAttribute("categorias",servicioCategorias.obtenerCategorias());
		return "admin/listadoCategorias";
	}
	@RequestMapping("registrarCategoria")
	public String registrarCategoria(Model model) {
		model.addAttribute("categoria",new Categoria());
		return "admin/registrarCategoria";
	}
	@RequestMapping("guardarCategoria")
	public String guardarCategoria(Categoria categoria, Model model) {
		servicioCategorias.registrarCategoria(categoria);
		return listarCategorias(model);		
	}
	@RequestMapping("borrarCategoria")
	public String borrarMascarilla(String id,Model model) {
		servicioCategorias.borrarCategoria(Integer.parseInt(id));
		return listarCategorias(model);
	}
	@RequestMapping("editarCategoria")
	public String editarMascarilla(String id,Model model) {
		Categoria c = servicioCategorias.obtenerCategoriaPorId(Integer.parseInt(id));
		model.addAttribute("categoria", c);
		return "admin/editarCategoria";
	}
	@RequestMapping("guardarCambiosCategoria")
	public String guardarCambiosMascarilla(Categoria categoria, Model model) {
		System.out.println("Actualizar datos de la categoria: " + categoria.toString());
		servicioCategorias.guardarCambiosCategoria(categoria);
		return listarCategorias(model);
	}
	
}



