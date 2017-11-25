/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import java.util.List;
import model.TbVF;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.primefaces.component.tabview.Tab;

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
    
    public List<TbVF> consultarPorAssunto(int codAssunto) {
        List<TbVF> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj where cod_assunto=?");
        qy.setInteger(0, codAssunto);
        lista = qy.list();
        return lista;
    }
    
}
