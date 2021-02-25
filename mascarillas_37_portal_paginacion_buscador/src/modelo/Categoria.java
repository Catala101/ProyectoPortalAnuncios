package modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Categoria {

	private String nombre;
	private String descripcion;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(
		name="mascarilla_categoria",
		joinColumns = {
				@JoinColumn(name="categoria_id",nullable = false,updatable = false)
		},
		inverseJoinColumns = {
				@JoinColumn(name="mascarilla_id",nullable = false, updatable =false)
		}
	)
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

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	public List<Mascarilla> getMascarillas() {
		return mascarillas;
	}

	public void setMascarillas(List<Mascarilla> mascarillas) {
		this.mascarillas = mascarillas;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
}
