/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbUsuarioDAO;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import model.TbUsuario;

/**
 *
 * @author Guilherme
 */
@ManagedBean
@ViewScoped
public class UsuarioMB {

    private TbUsuario selecionado;
    private List<TbUsuario> tbUsuario;
    private String cpfUsuario;

    /**
     * Creates a new instance of ProdutoMB
     */
    public UsuarioMB() {
        selecionado = new TbUsuario();
        cpfUsuario = "";
        
        filtrar();
    }

    public void filtrar() {
        TbUsuarioDAO dao = new TbUsuarioDAO();
        setTbUsuario(dao.consultarPorCPF(getCpfUsuario()));
    }

    public void novo() {
        setSelecionado(new TbUsuario());
        getSelecionado().setIdtUsuario(0);
        cpfUsuario = "";
    }

    public void salvar() {
        TbUsuarioDAO dao = new TbUsuarioDAO();
        if (getSelecionado().getIdtUsuario() == 0) {
            getSelecionado().setIdtUsuario(null);
            dao.incluirUsuario(getSelecionado());
        } else {
            dao.juntar(getSelecionado());
        }
        novo();
        filtrar();
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Resultado da Gravação", "Atualização efetivada na base de dados.");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void excluir() {
        TbUsuarioDAO dao = new TbUsuarioDAO();
        if (getSelecionado().getIdtUsuario() != 0) {
            if (dao.excluir(getSelecionado().getIdtUsuario())) {
                FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Resultado da Exclusão", "Exclusão efetuada com sucesso.");
                FacesContext.getCurrentInstance().addMessage(null, msg);
            } else {
                FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Resultado da Exclusao", "Não foi possível excluir.");
                FacesContext.getCurrentInstance().addMessage(null, msg);
            }
        }
        novo();
        filtrar();
    }

    /**
     * @return the selecionado
     */
    public TbUsuario getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbUsuario selecionado) {
        this.selecionado = selecionado;
    }

    /**
     * @return the cpfUsuario
     */
    public String getCpfUsuario() {
        return cpfUsuario;
    }

    /**
     * @param cpfUsuario the cpfUsuario to set
     */
    public void setCpfUsuario(String cpfUsuario) {
        this.cpfUsuario = cpfUsuario;
    }

    /**
     * @return the tbUsuario
     */
    public List<TbUsuario> getTbUsuario() {
        return tbUsuario;
    }

    /**
     * @param tbUsuario the tbUsuario to set
     */
    public void setTbUsuario(List<TbUsuario> tbUsuario) {
        this.tbUsuario = tbUsuario;
    }

}
