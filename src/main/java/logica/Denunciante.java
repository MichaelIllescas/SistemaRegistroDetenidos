/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;

/**
 *
 * @author jonii
 */
@Entity
public class Denunciante extends Persona implements Serializable{

    public Denunciante() {
    }

    public Denunciante(int id, String nombre, String apellido, String dni, String direccion, String apodo, String telefono, String ocupacion, Date fechaNacimiento, String sexo, String instuccion, EstadoCivil estadoCivil, Nacionalidad nacionalidad) {
        super(id, nombre, apellido, dni, direccion, apodo, telefono, ocupacion, fechaNacimiento, sexo, instuccion, estadoCivil, nacionalidad);
    }
    
    
}
