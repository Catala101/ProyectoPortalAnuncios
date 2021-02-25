package servicios;

import java.util.List;

import modelo.Mascarilla;
import modelo.Usuario;

public interface ServicioUsuarios {
	
	public void registrarUsuario(Usuario u);
	public Usuario obtenerUsuarioPorEmailYPass(String email, String pass);
	public List<Usuario> obtenerUsuarios();
	public void borrarUsuario(int id);
	public Usuario obtenerUsuarioPorId(int id);
	public void guardarCambiosUsuario(Usuario u);
	
}
