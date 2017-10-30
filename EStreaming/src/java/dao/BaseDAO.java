/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.lang.reflect.ParameterizedType;
import java.util.Date;
import java.util.List;
import model.TbDisciplina;
import model.TbUsuario;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Hiragi
 */
public class BaseDAO<Tab> {

    private Class<Tab> classe;
    protected Session hib;

    public BaseDAO() {
        classe = (Class<Tab>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        hib = HibernateUtil.getSession();
    }

    public Class<Tab> getClasse() {
        return this.classe;
    }

    public Tab incluir(Tab obj) {
        Transaction ts = hib.beginTransaction();
        hib.persist(obj);
        hib.flush();
        ts.commit();
        return obj;
    }
    
    public TbDisciplina incluirDisciplina(Tab obj) {
        Transaction ts = hib.beginTransaction();
        TbDisciplina tbDisciplina = new TbDisciplina();
        tbDisciplina = (TbDisciplina) obj;
        tbDisciplina.setDtaInsercao(new Date());
        hib.persist(tbDisciplina);
        hib.flush();
        ts.commit();
        return tbDisciplina;
    }
    
    public TbUsuario incluirUsuario(Tab obj) {
        Transaction ts = hib.beginTransaction();
        TbUsuario usuario = (TbUsuario) obj;
        usuario.setDtaInsercao(new Date());
        hib.persist(usuario);
        hib.flush();
        ts.commit();
        return usuario;
    }

    public boolean excluir(int idt) {
        Transaction ts = hib.beginTransaction();
        Tab obj = consultarPorIdt(idt);
        hib.delete(obj);
        hib.flush();
        ts.commit();
        return true;
    }
    
//    public boolean excluirVF(int idt) {
//        Transaction ts = hib.beginTransaction();
//        Tab obj = consultarPorIdtVF(idt);
//        hib.delete(obj);
//        hib.flush();
//        ts.commit();
//        return true;
//    }

    public Tab alterar(Tab obj) {
        Transaction ts = hib.beginTransaction();
        hib.update(obj);
        hib.flush();
        ts.commit();
        return obj;
    }

    public Tab juntar(Tab obj) {
        Transaction ts = hib.beginTransaction();
        hib.merge(obj);
        hib.flush();
        ts.commit();
        return obj;
    }

    public Tab consultarPorIdt(int idt) {
        Tab obj;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE idt" + getClasse().getSimpleName().substring(2) + "=?");
        qy.setInteger(0, idt);
        obj = (Tab) qy.uniqueResult();
        return obj;
    }
    
//    public Tab consultarPorIdtVF(int idt) {
//        Tab obj;
//        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE idtVf=?");
//        qy.setInteger(0, idt);
//        obj = (Tab) qy.uniqueResult();
//        return obj;
//    }

    public Tab consultarPorMat(String mat) {
        Tab obj;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE mat" + getClasse().getSimpleName().substring(2) + " = ?");
        qy.setString(0, mat);
        obj = (Tab) qy.uniqueResult();
        return obj;
    }

    public List<Tab> consultarTodos() {
        List<Tab> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj ");
        lista = qy.list();
        return lista;
    }

    public List<Tab> consultarPorNme(String nme) {
        List<Tab> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE nme" + getClasse().getSimpleName().substring(2) + " LIKE ?");
        qy.setString(0, "%" + nme + "%");
        lista = qy.list();
        return lista;
    }
    
    public List<Tab> consultarPorTxt(String txt, String campoTxt) {
        List<Tab> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE " + campoTxt + " LIKE ?");
        qy.setString(0, "%" + txt + "%");
        lista = qy.list();
        return lista;
    }
    
        public List<Tab> consultarPorCPF(String cpf) {
        List<Tab> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE cpf" + getClasse().getSimpleName().substring(2) + " LIKE ?");
        qy.setString(0, "%" + cpf + "%");
        lista = qy.list();
        return lista;
    }

    public List<Tab> consultarPorSgl(String sgl) {
        List<Tab> lista;
        Query qy = hib.createQuery("SELECT obj FROM " + getClasse().getSimpleName() + " obj WHERE sgl" + getClasse().getSimpleName().substring(2) + " LIKE ?");
        qy.setString(0, "%" + sgl + "%");
        lista = qy.list();
        return lista;
    }

}
