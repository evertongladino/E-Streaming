/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbMidiaDAO;
import model.TbMidia;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Hiragi
 */
@ManagedBean
@ViewScoped
public class UploadMidiaMB {

    private TbMidia selecionado;
    private List<TbMidia> tbMidia;
    private String caminhoMidia;

    /**
     * Creates a new instance of ProdutoMB
     */
    public UploadMidiaMB() {
        selecionado = new TbMidia();
        caminhoMidia = "";
        filtrar();
    }

    public void filtrar() {
        TbMidiaDAO dao = new TbMidiaDAO();
        setTbMidiaes(dao.consultarPorCaminho(getCaminhoMidia()));
    }

    public void novo() {
        setSelecionado(new TbMidia());
        getSelecionado().setIdtMidia(0);
        caminhoMidia = "";
    }

    public void salvar() {
        TbMidiaDAO dao = new TbMidiaDAO();
        if (getSelecionado().getIdtMidia()== 0) {
            getSelecionado().setIdtMidia(0);
            dao.incluir(getSelecionado());
        } else {
            dao.juntar(getSelecionado());
        }
        novo();
        filtrar();
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Resultado da Gravação", "Atualização efetivada na base de dados.");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void excluir() {
        TbMidiaDAO dao = new TbMidiaDAO();
        if (getSelecionado().getIdtMidia()!= 0) {
            if (dao.excluir(getSelecionado().getIdtMidia())) {
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
    public TbMidia getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbMidia selecionado) {
        this.selecionado = selecionado;
    }

    /**
     * @return the caminhoMidia
     */
    public String getCaminhoMidia() {
        return caminhoMidia;
    }

    /**
     * @param caminhoMidia the caminhoMidia to set
     */
    public void setCaminhoMidia(String caminhoMidia) {
        this.caminhoMidia = caminhoMidia;
    }

    /**
     * @return the tbMidia
     */
    public List<TbMidia> getTbMidia() {
        return tbMidia;
    }

    /**
     * @param tbMidia the tdTipoQuestaoes to set
     */
    public void setTbMidiaes(List<TbMidia> tbMidia) {
        this.tbMidia = tbMidia;
    }

}
