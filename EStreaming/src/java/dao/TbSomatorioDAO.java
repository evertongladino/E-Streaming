/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.TbSomatorio;
import org.hibernate.Query;
import org.primefaces.component.tabview.Tab;

/**
 *
 * @author ra21490108
 */
public class TbSomatorioDAO extends BaseDAO<TbSomatorio>{
    
    public List<TbSomatorio> consultarPorAssunto(int codAssunto) {
        List<TbSomatorio> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj where cod_assunto=?");
        qy.setInteger(0, codAssunto);
        lista = qy.list();
        return lista;
    }  
}
