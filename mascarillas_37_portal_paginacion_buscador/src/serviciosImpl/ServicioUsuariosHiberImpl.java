package serviciosImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import modelo.Categoria;
import modelo.Mascarilla;
import modelo.Usuario;
import servicios.ServicioUsuarios;

@Transactional
@Service
public class ServicioUsuariosHiberImpl implements ServicioUsuarios{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void registrarUsuario(Usuario u) {
		
		sessionFactory.getCurrentSession().save(u);
		
	}
	@Override
	public Usuario obtenerUsuarioPorEmailYPass(String email, String pass) {
		//Quiero la información requerida por un usuario
		Usuario u = (Usuario)
				sessionFactory.getCurrentSession().
				createCriteria(Usuario.class).
				add(Restrictions.eq("email", email)).
				add(Restrictions.eq("pass", pass)).uniqueResult();
		return u;
	}
	@Override
	public List<Usuario> obtenerUsuarios() {
		return sessionFactory.getCurrentSession().createCriteria(Usuario.class).list();
	}
	@Override
	public void borrarUsuario(int id) {
		Usuario u = (Usuario) sessionFactory.getCurrentSession().get(Usuario.class, id);
		sessionFactory.getCurrentSession().delete(u);
		
	}
	@Override
	public Usuario obtenerUsuarioPorId(int id) {
		
		Usuario u = (Usuario) sessionFactory.getCurrentSession().get(Usuario.class, id);
		
		return u;
	}

	@Override
	public void guardarCambiosUsuario(Usuario u) {
		sessionFactory.getCurrentSession().merge(u);
		
	}

}
