<<<<<<< HEAD
package dao;

import java.util.List;

import org.hibernate.Query;

import model.TbAssunto;

public class TbAssuntoDAO extends BaseDAO<TbAssunto>{
	
	public List<TbAssunto> consultarporEnuniado(String enunciado) {
		
		List<TbAssunto> lista;
        Query qy = hib.createQuery("SELECT obj FROM TbAssunto obj WHERE txtTemaAssunto LIKE ?");
        qy.setString(0, "%" + enunciado + "%");
        lista = qy.list();
        return lista;
	}

=======
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.TbAssunto;


/**
 *
 * @author ra21485251
 */
    public class TbAssuntoDAO extends BaseDAO<TbAssunto>{
    
>>>>>>> refs/remotes/origin/CRUDsParaiba
}
