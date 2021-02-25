package modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Usuario {
	
	
	private String nombre;
	 
	private String email;
	
	private String pass;
	
	@OneToMany(cascade = {CascadeType.ALL}, 
			mappedBy = "usuario", 
			fetch = FetchType.LAZY)
	private List<Mascarilla> mascarillas = new ArrayList<Mascarilla>();

	@Id
	@GeneratedValue
	private int id;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
	

	public List<Mascarilla> getMascarillas() {
		return mascarillas;
	}

	public void setLibros(List<Mascarilla> mascarillas) {
		this.mascarillas = mascarillas;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Usuario [nombre=" + nombre + ", email=" + email + ", pass=" + pass + ", id=" + id + "]";
	}
	

}
