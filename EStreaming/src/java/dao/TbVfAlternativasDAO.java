/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.TbVF;
import model.TbVFAlternativas;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.primefaces.component.tabview.Tab;
/**
 *
 * @author Caio Henrique
 */
public class TbVfAlternativasDAO extends BaseDAO<TbVFAlternativas> {

    public TbVFAlternativas incluirVFAlternativas(TbVFAlternativas obj) {
        Transaction ts = hib.beginTransaction();
        hib.persist(obj);
        hib.flush();
        ts.commit();
        return obj;
    }
    
    public boolean excluirVFAlternativa(int idt) {
        Transaction ts = hib.beginTransaction();
        try {
            TbVFAlternativas obj = consultarPorIdtVFAlternativa(idt);
            hib.delete(obj);
            hib.flush();
            ts.commit();
        } catch (Exception e) {
            
            ts.rollback();
        }
        return true;
    }
    
    public TbVFAlternativas consultarPorIdtVFAlternativa(int idt) {
        Tab obj;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE idt_v_f_alternativas=?");
        qy.setInteger(0, idt);
        TbVFAlternativas tbVFAlternativa = (TbVFAlternativas) qy.uniqueResult();
        return tbVFAlternativa;
    }
    
}
