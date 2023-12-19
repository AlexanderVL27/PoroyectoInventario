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
public class listadopollo {
    ArrayList<pollo>lista;

    public listadopollo() {
        lista=new ArrayList();
    }
    public void agregar(pollo c){
        lista.add(c);
    }
}
