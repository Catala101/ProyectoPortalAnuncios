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
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
public class Mascarilla {
	
	@NotEmpty(message = "El nombre no puede estar vacio")
	@Size(min = 3, max = 10, message = "El nombre debe tener entre 3 y 10 caracteres")
	private String nombre;
	
	@NotEmpty(message = "La descripciÛn no puede estar vacia")
	private String descripcion;
	//@NotEmpty(message = "El fabricante no puede estar vacio")
	//Lo mismo pero usando expresiÛn regular:
	@Pattern(regexp ="[a-zA-Z ·ÈÌÛ˙¸¡…Õ”⁄‹Ò—]{2,20}", message = "El fabricante debe tener entre 2 y 20 caracteres")
	private String fabricante;
	private int stock;
	@NumberFormat(style=Style.NUMBER, pattern = "#,###.###")
	private double precio;
	@Transient //Hace que hibernate no tenga en cuenta el siguiente campo:
	private CommonsMultipartFile portada;
	
	//MERGE
		@ManyToOne(cascade = {CascadeType.MERGE},
				targetEntity = Usuario.class,
				fetch = FetchType.EAGER
				)
		private Usuario usuario;
		//Nos incluya adem·s de los libros la categoria con EAGER
		@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
		@JoinTable(
			name="mascarilla_categoria",
			joinColumns = {
					@JoinColumn(name="mascarilla_id",nullable = false,updatable = false)
			},
			inverseJoinColumns = {
					@JoinColumn(name="categoria_id",nullable = false, updatable =false)
			}
		)
		private List<Categoria> categorias = new ArrayList<Categoria>();
		
	@Id @GeneratedValue
	private int id;
	
	public Mascarilla() {
		// TODO Auto-generated constructor stub
	}

	public Mascarilla(String nombre, String descripcion, String fabricante, int stock, double precio) {
		super();
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.fabricante = fabricante;
		this.stock = stock;
		this.precio = precio;
	}

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

	public String getFabricante() {
		return fabricante;
	}

	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
	public CommonsMultipartFile getPortada() {
		return portada;
	}

	public void setPortada(CommonsMultipartFile portada) {
		this.portada = portada;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public List<Categoria> getCategorias() {
		return categorias;
	}

	public void setCategorias(List<Categoria> categorias) {
		this.categorias = categorias;
	}
	
	@Override
	public String toString() {
		return "Mascarilla [nombre=" + nombre + ", descripcion=" + descripcion + ", fabricante=" + fabricante
				+ ", stock=" + stock + ", precio=" + precio + ", id=" + id + "]";
	}

	

	
	
}
