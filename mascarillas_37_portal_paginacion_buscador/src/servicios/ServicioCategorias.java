package servicios;

import java.util.List;
import java.util.Map;

import modelo.Categoria;

public interface ServicioCategorias {

	public void registrarCategoria(Categoria c);
	public List<Categoria> obtenerCategorias();
	
	public List<Map<String, Object>> obtenerCategoriasParaListado();
	public Categoria obtenerCategoriaPorId(int id);
	public void guardarCambiosCategoria(Categoria c);
	void borrarCategoria(int id);
}
