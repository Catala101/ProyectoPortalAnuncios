package serviciosImpl;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import constantesSQL.ConstantesSQL;
import modelo.Categoria;
import modelo.Mascarilla;
import modelo.Usuario;
import servicios.ServicioMascarillas;

@Service
@Transactional
public class ServicioMascarillasHiberImpl implements ServicioMascarillas{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void registrarMascarilla(Mascarilla m, int idUsuario, int inputGroupSelect04) {
		
		//primero obtenemos el usuario del id indicado
		Usuario u = (Usuario) sessionFactory.getCurrentSession().
				get(Usuario.class, idUsuario);
		//asociar el usuario al libro a registrar
		m.setUsuario(u);
		
		//asociar la categoría a la mascarilla
		Categoria c = (Categoria) sessionFactory.getCurrentSession().get(Categoria.class, inputGroupSelect04);
		m.getCategorias().add(c);
		
		//y ya finalmente guardo el libro
		
		
		
		//La siguiente linea no solo registra en BD, también asgina automaticamente una id  en BD
		sessionFactory.getCurrentSession().save(m);
		
	}

	@Override
	public List<Mascarilla> obtenerMascarillas(String nombreAbuscar, int comienzo) {
		
		return sessionFactory.getCurrentSession().
				createCriteria(Mascarilla.class).
				add(Restrictions.ilike("nombre", "%" + nombreAbuscar + "%")).
				setMaxResults(6).
				setFirstResult(comienzo).
				addOrder(Order.desc("id")).list();
	}
	//Obtenemos el total de mascarillas mediante constante SQL para establecer un límite
	@Override
	public int obtenerTotalMascarillas(String nombreAbuscar) {
		
		int total = Integer.parseInt(sessionFactory.getCurrentSession().createSQLQuery(
				constantesSQL.ConstantesSQL.OBTENER_TOTAL_MASCARILLAS).
				setParameter("nombre", "%"+nombreAbuscar+"%").
				list().get(0).toString());
				
		return total;
	}
	
	@Override
	public void borrarMascarilla(int id) {
		
		Mascarilla m = (Mascarilla) sessionFactory.getCurrentSession().get(Mascarilla.class, id);
		sessionFactory.getCurrentSession().delete(m);
		
	}

	@Override
	public Mascarilla obtenerMascarillaPorId(int id) {
		
		Mascarilla m = (Mascarilla) sessionFactory.getCurrentSession().get(Mascarilla.class, id);
		
		return m;
	}

	@Override
	public void guardarCambiosMascarilla(Mascarilla m, int idUsuario) {
		m.setUsuario((Usuario) sessionFactory.getCurrentSession().get(Usuario.class, idUsuario));
		sessionFactory.getCurrentSession().merge(m);
		
	}
	@Override
	public List<Map<String, Object>> obtenerMascarillasParaListado( int idUsuario) {
		SQLQuery query = sessionFactory.getCurrentSession().
				createSQLQuery(ConstantesSQL.OBTENER_LISTADO_MASCARILLAS);
		query.setParameter("idUsuario", idUsuario);
		//La siguente línea es para que no nos devuelva cada fila de resultado en un array,
		//sino un Map donde se diga cada compo que nombre tiene
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		return query.list();
	}

	@Override
	public Map<String, Object> obtenerMascarillaParaEditar(int idMascarilla) {
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(ConstantesSQL.OBTENER_MASCARILLA_PARA_EDITAR);
		query.setParameter("idMascarilla", idMascarilla);
		query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		
		return (Map<String, Object>) query.uniqueResult();
		
	}

}
