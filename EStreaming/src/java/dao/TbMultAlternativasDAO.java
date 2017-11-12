/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.TbMultAlternativas;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.primefaces.component.tabview.Tab;
/**
 *
 * @author ra21490108
 */
public class TbMultAlternativasDAO extends BaseDAO<TbMultAlternativas>{
    
    public TbMultAlternativas consultarAlternativa(int idt) {
        TbMultAlternativas obj;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE idt_alternativas=?");
        qy.setInteger(0, idt);
        obj = (TbMultAlternativas) qy.uniqueResult();
        return obj;
    }
    
    public boolean excluir(int idt) {
        Transaction ts = hib.beginTransaction();
        TbMultAlternativas obj = consultarAlternativa(idt);
        
        try {
            
            hib.delete(obj);
            hib.flush();
            ts.commit();            
        }
        catch (Exception e) {
            
            ts.rollback();
        }
        return true;
    }
}
