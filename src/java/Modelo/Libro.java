/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author ErikHernandez
 */
public class Libro {
    private int id_libro, existencia;
    private long isbn;
    private String titulo, editorial;
    private float precio_v, precio_c;
    private Proveedor id_proveedor;
    
    public Libro () {
        
    }

    public Libro(int id_libro, int existencia, Proveedor id_proveedor, long isbn, String titulo, String editorial, float precio_v, float precio_c) {
        this.id_libro = id_libro;
        this.existencia = existencia;
        this.id_proveedor = id_proveedor;
        this.isbn = isbn;
        this.titulo = titulo;
        this.editorial = editorial;
        this.precio_v = precio_v;
        this.precio_c = precio_c;
    }

    public int getId_libro() {
        return id_libro;
    }

    public void setId_libro(int id_libro) {
        this.id_libro = id_libro;
    }

    public long getIsbn() {
        return isbn;
    }

    public void setIsbn(long isbn) {
        this.isbn = isbn;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public float getPrecio_v() {
        return precio_v;
    }

    public void setPrecio_v(float precio_v) {
        this.precio_v = precio_v;
    }

    public float getPrecio_c() {
        return precio_c;
    }

    public void setPrecio_c(float precio_c) {
        this.precio_c = precio_c;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public Proveedor getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(Proveedor id_proveedor) {
        this.id_proveedor = id_proveedor;
    }   
}