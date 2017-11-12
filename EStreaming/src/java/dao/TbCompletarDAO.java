/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.TbCompletar;
import org.hibernate.Query;

/**
 *
 * @author Gilberto
 */
public class TbCompletarDAO extends BaseDAO<TbCompletar>{

    public List<TbCompletar> consultarPorEnunciado(String enunciado) {
        List<TbCompletar> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE txtEnunciado LIKE ?");
        qy.setString(0, "%" + enunciado + "%");
        lista = qy.list();
        return lista;
    }
    
    public List<TbCompletar> consultarPorFrase(String frase) {
        List<TbCompletar> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE txtFrase LIKE ?");
        qy.setString(0, "%" + frase + "%");
        lista = qy.list();
        return lista;
    }
}
