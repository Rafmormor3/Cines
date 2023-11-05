package com.jacaranda.model;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity

public class Cine {
	
	@Id //primary key
	private String cine;
	@Column(name="ciudad_cine")//nombre de las columnas 
	private String ciudadCine;
	@Column(name="direccion_cine")
	private String direccion;
	
	public Cine(String cine, String ciudadCine, String direccion) {
		super();
		this.cine = cine;
		this.ciudadCine = ciudadCine;
		this.direccion = direccion;
	}
	
	public Cine() {
		super();
	}

	public String getCine() {
		return cine;
	}

	public void setCine(String cine) {
		this.cine = cine;
	}

	public String getCiudadCine() {
		return ciudadCine;
	}

	public void setCiudadCine(String ciudadCine) {
		this.ciudadCine = ciudadCine;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cine, ciudadCine, direccion);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cine other = (Cine) obj;
		return Objects.equals(cine, other.cine) && Objects.equals(ciudadCine, other.ciudadCine)
				&& Objects.equals(direccion, other.direccion);
	}

	@Override
	public String toString() {
		return "Cine [cine=" + cine + ", ciudadCine=" + ciudadCine + ", direccion=" + direccion + "]";
	}

	
	
	
	
	
}
