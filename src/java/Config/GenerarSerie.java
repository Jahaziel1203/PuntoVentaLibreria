/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Config;

/**
 *
 * @author ErikHernandez
 */
public class GenerarSerie {
    private int dato;
    private String numero;
    
    public String numeroSerie (int datoE) {
        this.dato = datoE + 1;
        
        if ((dato >= 10000000) && (dato < 100000000))
            numero = "" + dato;
        else if ((dato >= 1000000) && (dato < 10000000))
            numero = "0" + dato;
        else if ((dato >= 100000) && (dato < 1000000))
            numero = "00" + dato;
        else if ((dato >= 10000) && (dato < 100000))
            numero = "000" + dato;
        else if ((dato >= 1000) && (dato < 10000))
            numero = "0000" + dato;
        else if ((dato >= 100) && (dato < 1000))
            numero = "00000" + dato;
        else if ((dato >= 10) && (dato < 100))
            numero = "000000" + dato;
        else if (dato < 10)
            numero = "0000000" + dato;
            
        return numero;
    }
}