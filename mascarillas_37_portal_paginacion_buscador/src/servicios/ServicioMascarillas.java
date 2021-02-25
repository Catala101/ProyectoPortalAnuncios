package servicios;

import java.util.List;
import java.util.Map;

import modelo.Mascarilla;

//Servicio parecido a un DAO, tiene uso más amplio para el tipo de dato indicado

public interface ServicioMascarillas {
	
	public void registrarMascarilla(Mascarilla m, int idUsuario, int inputGroupSelect04);
	public List<Map<String, Object>> obtenerMascarillasParaListado(int idUsuario);
	public Map<String, Object> obtenerMascarillaParaEditar(int idMascarilla);
	public List<Mascarilla> obtenerMascarillas(String nombreAbuscar, int comienzo);
	public int obtenerTotalMascarillas(String nombreAbuscar);
	public void borrarMascarilla(int id);
	public Mascarilla obtenerMascarillaPorId(int id);
	public void guardarCambiosMascarilla(Mascarilla m, int idUsuario);
	
}
