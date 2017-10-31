/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.TbTipoMidia;
import org.hibernate.Query;

/**
 *
 * @author ra21490108
 */
public class TbTipoMidiaDAO extends BaseDAO<TbTipoMidia> {
    
    public List<TbTipoMidia> consultarPorTpo(String tpo) {
        List<TbTipoMidia> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE tpo_midia LIKE ?");
        qy.setString(0, "%" + tpo + "%");
        lista = qy.list();
        return lista;
    }
    
}
