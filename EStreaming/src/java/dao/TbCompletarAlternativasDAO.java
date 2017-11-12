/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.TbCompletarAlternativas;
import org.hibernate.Query;

/**
 *
 * @author Gilberto
 */
public class TbCompletarAlternativasDAO extends BaseDAO<TbCompletarAlternativas>{
    
    public List<TbCompletarAlternativas> consultarPorPalavra(String palavra) {
        List<TbCompletarAlternativas> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE txtPalavra LIKE ?");
        qy.setString(0, "%" + palavra + "%");
        lista = qy.list();
        return lista;
    }

    public List<TbCompletarAlternativas> consultarPorFK(Integer fk) {
        List<TbCompletarAlternativas> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE codCompletar=?");
        qy.setInteger(0, fk);
        lista = qy.list();
        return lista;
    }
}
