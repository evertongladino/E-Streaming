/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.TbUsuario;
import org.hibernate.Query;

/**
 *
 * @author Gilberto
 */
public class TbUsuarioDAO extends BaseDAO<TbUsuario> {

    public TbUsuario consultarPorLogin(String email, String senha) {
        TbUsuario obj;
        Query qy = hib.createQuery("SELECT obj FROM TbUsuario obj WHERE emlUsuario=? AND pwdUsuario=MD5(?)");
        qy.setString(0, email);
        qy.setString(1, senha);
        obj = (TbUsuario) qy.uniqueResult();
        return obj;
    }
}
