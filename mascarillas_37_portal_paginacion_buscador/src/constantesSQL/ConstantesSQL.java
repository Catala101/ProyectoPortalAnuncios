package constantesSQL;

public class ConstantesSQL {
	
	public static final String OBTENER_LISTADO_MASCARILLAS = 
			"select nombre, descripcion, fabricante, stock, precio, id from mascarilla where usuario_id = :idUsuario order by id desc";
	public static final String OBTENER_MASCARILLA_PARA_EDITAR = 
			"select * from mascarilla where id = :idMascarilla";
	public static final String OBTENER_LISTADO_CATEGORIAS = 
			"select id, nombre from categoria";
	public static final String OBTENER_USUARIO_PARA_EDITAR = 
			"select * from usuario where id = :idUsuario";
	public static final String OBTENER_TOTAL_MASCARILLAS =
			"select count(id) from mascarilla where nombre like :nombre";
}
