/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.TbMidia;
import org.hibernate.Query;

/**
 *
 * @author ra21490108
 */
public class TbMidiaDAO extends BaseDAO<TbMidia>{
    
    public List<TbMidia> consultarPorCaminho(String nme) {
        List<TbMidia> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE txt_caminho LIKE ?");
        qy.setString(0, "%" + nme + "%");
        lista = qy.list();
        return lista;
    }
    
}
