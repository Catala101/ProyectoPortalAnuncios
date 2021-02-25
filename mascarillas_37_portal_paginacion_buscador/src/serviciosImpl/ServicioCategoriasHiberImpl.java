package serviciosImpl;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import modelo.Categoria;
import modelo.Mascarilla;
import modelo.Usuario;
import servicios.ServicioCategorias;

@Transactional
@Service
public class ServicioCategoriasHiberImpl implements ServicioCategorias{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void registrarCategoria(Categoria c) {
		sessionFactory.getCurrentSession().save(c);
	}

	@Override
	public List<Categoria> obtenerCategorias() {
		return sessionFactory.getCurrentSession().
				createCriteria(Categoria.class).addOrder(Order.desc("id")).list();
	}
	
	@Override
	public void borrarCategoria(int id) {
		
		Categoria c = (Categoria) sessionFactory.getCurrentSession().get(Categoria.class, id);
		sessionFactory.getCurrentSession().delete(c);
		
	}
	
	@Override
	public List<Map<String, Object>> obtenerCategoriasParaListado() {
		SQLQuery query = sessionFactory.getCurrentSession().
				createSQLQuery(constantesSQL.ConstantesSQL.OBTENER_LISTADO_CATEGORIAS);
		//para que me el resultado incluyendo los nombres d elos campos y el json se forme 
		//bien luego
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		return query.list();
	}
	
	@Override
	public Categoria obtenerCategoriaPorId(int id) {
		Categoria c = (Categoria) sessionFactory.getCurrentSession().get(Categoria.class, id);
		return c;
	}
	
	@Override
	public void guardarCambiosCategoria(Categoria c) {
		sessionFactory.getCurrentSession().merge(c);
	}
}
