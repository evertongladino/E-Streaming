/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbUsuarioDAO;
import java.io.IOException;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;
import model.TbUsuario;

/**
 *
 * @author Gilberto
 */
@ManagedBean
@SessionScoped
public class LoginMB {

    private String usuario;
    private String senha;
    private String nome;
    private String perfil;

    /**
     * Creates a new instance of ControleAcessoMB
     */
    public LoginMB() {
        
    }

    public String validar() {
        String ret = "index";
        HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);

        TbUsuarioDAO dao = new TbUsuarioDAO();
        TbUsuario pessoa = dao.consultarPorLogin(getUsuario(), getSenha());

        if (pessoa == null) {
            setPerfil("INVALIDO");
            FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Falha no login", "Você não tem permissão para entrar no sistema.");
            FacesContext.getCurrentInstance().addMessage(null, msg);
        } else {
            String perfil="instituicao";
            
            setPerfil(perfil);
            
            setNome(pessoa.getEmlUsuario());
            switch (getPerfil()) {
                case "instituicao":
                    ret = "/instituicao/MenuInstituicao";
                    break;
                case "Motorista":
                    ret = "/Motorista/MenuMotorista";
                    break;
                case "Responsavel":
                    ret = "/Responsavel/MenuResponsavel";
                    break;
                default:
                    break;
            }
        }
        sessao.setAttribute("SESSAO_PERFIL", getPerfil());
        return ret;
    }
    
    public void deslogar() throws IOException{
        HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
        sessao.invalidate();
        FacesContext.getCurrentInstance().getExternalContext().redirect("index.xhtml");
        System.out.println("Sucesso");
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the perfil
     */
    public String getPerfil() {
        return perfil;
    }

    /**
     * @param perfil the perfil to set
     */
    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

}
