/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.util.ArrayList;

/**
 *
 * @author villa_xaz9a7o
 */
public class listapuerco {
    ArrayList<puerco>lista;

    public listapuerco() {
        lista=new ArrayList();
    }
    
    public void agregar(puerco c){
        lista.add(c);
    }

    public void agregar(pez pez) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
