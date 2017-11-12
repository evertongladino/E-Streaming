/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbTipoMidiaDAO;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import model.TbTipoMidia;

/**
 *
 * @author Hiragi
 */
@ManagedBean
@ViewScoped
public class TipoMidiaMB {

    private TbTipoMidia selecionado;
    private List<TbTipoMidia> tbTipoMidia;
    private String tipoMidia;

    /**
     * Creates a new instance of ProdutoMB
     */
    public TipoMidiaMB() {
        selecionado = new TbTipoMidia();
        tipoMidia = "";
        filtrar();
    }

    public void filtrar() {
        TbTipoMidiaDAO dao = new TbTipoMidiaDAO();
        setTbTipoMidia(dao.consultarPorTpo(getTipoMidia()));
    }

    public void novo() {
        setSelecionado(new TbTipoMidia());
        getSelecionado().setIdtTipoMidia(0);
        tipoMidia = "";
    }

    public void salvar() {
        TbTipoMidiaDAO dao = new TbTipoMidiaDAO();
        if (getSelecionado().getIdtTipoMidia()== 0) {
            getSelecionado().setIdtTipoMidia(null);
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
        TbTipoMidiaDAO dao = new TbTipoMidiaDAO();
        if (getSelecionado().getIdtTipoMidia()!= 0) {
            if (dao.excluir(getSelecionado().getIdtTipoMidia())) {
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
    public TbTipoMidia getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbTipoMidia selecionado) {
        this.selecionado = selecionado;
    }

    /**
     * @return the tipoMidia
     */
    public String getTipoMidia() {
        return tipoMidia;
    }

    /**
     * @param tipoMidia the tipoMidia to set
     */
    public void setTipoMidia(String tipoMidia) {
        this.tipoMidia = tipoMidia;
    }

    /**
     * @return the tbTipoMidia
     */
    public List<TbTipoMidia> getTbTipoMidia() {
        return tbTipoMidia;
    }

    /**
     * @param tbTipoMidia the tdTipoMidia to set
     */
    public void setTbTipoMidia(List<TbTipoMidia> tbTipoMidia) {
        this.tbTipoMidia = tbTipoMidia;
    }

}
