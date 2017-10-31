/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import javafx.scene.control.Tab;
import model.TbVF;
import org.hibernate.Query;
import org.hibernate.Transaction;

/**
 *
 * @author Caio Henrique
 */
public class TbVfDAO extends BaseDAO<TbVF>{
    
    public boolean excluirVF(int idt) {
        Transaction ts = hib.beginTransaction();
        TbVF obj = consultarPorIdtVF(idt);
        hib.delete(obj);
        hib.flush();
        ts.commit();
        return true;
    }
    
    public TbVF consultarPorIdtVF(int idt) {
        Tab obj;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE idtVf=?");
        qy.setInteger(0, idt);
        TbVF tbVF = (TbVF) qy.uniqueResult();
        return tbVF;
    }
    
}
