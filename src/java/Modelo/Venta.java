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
public class Venta {
    private int item;
    private int id_venta;
    private int id_empleado;
    private int id_producto;
    private String numSerie;
    private String titulo;
    private float precio_v;
    private int cantidad;
    private float subtotal;
    private float monto;
    
    public Venta () {
        
    }

    public Venta(int item, int id_venta, int id_empleado, int id_producto, String numSerie, 
            String titulo, float precio_v, int cantidad, float subtotal, float monto) {
        this.item = item;
        this.id_venta = id_venta;
        this.id_empleado = id_empleado;
        this.id_producto = id_producto;
        this.numSerie = numSerie;
        this.titulo = titulo;
        this.precio_v = precio_v;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
        this.monto = monto;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNumSerie() {
        return numSerie;
    }

    public void setNumSerie(String numSerie) {
        this.numSerie = numSerie;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public float getPrecio_v() {
        return precio_v;
    }

    public void setPrecio_v(float precio_v) {
        this.precio_v = precio_v;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(float subtotal) {
        this.subtotal = subtotal;
    }

    public float getMonto() {
        return monto;
    }

    public void setMonto(float monto) {
        this.monto = monto;
    }
}