/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbMidiaDAO;
import dao.TbTipoMidiaDAO;
import model.TbMidia;
import model.TbTipoMidia;
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
public class MidiaMB {

    private TbMidia selecionado;
    private List<TbMidia> tbMidia;
    private List<TbTipoMidia> tipoMidia;
    private Integer idtMidia;
    private String caminhoMidia = "";

    /**
     * Creates a new instance of MidiaMB
     */
    public MidiaMB() {
        selecionado = new TbMidia();
        idtMidia = null;
        
        TbTipoMidiaDAO daoTipoMidia = new TbTipoMidiaDAO();
        tipoMidia = daoTipoMidia.consultarTodos();
        
        filtrar();
    }

    public void filtrar() {
        TbMidiaDAO dao = new TbMidiaDAO();
        setTbMidia(dao.consultarPorCaminho(getCaminhoMidia()));
    }

    public void novo() {
        setSelecionado(new TbMidia());
        getSelecionado().setIdtMidia(0);
        getSelecionado().setStsMidia(true);
        getSelecionado().getTbTipoMidia();
        caminhoMidia = "";
    }

    public void salvar() {
        TbMidiaDAO dao = new TbMidiaDAO();
        if (getSelecionado().getIdtMidia()== 0) {
            getSelecionado().setIdtMidia(0);
            getSelecionado().setDtaInsercao(new java.util.Date());
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
    
    public Integer getIdtMidia() {
        return idtMidia;
    }

    public void setIdtMidia(Integer idtMidia) {
        this.idtMidia = idtMidia;
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
    public void setTbMidia(List<TbMidia> tbMidia) {
        this.tbMidia = tbMidia;
    }
    
    public void setTipoMidia(List<TbTipoMidia> tipoMidia) {
        this.tipoMidia = tipoMidia;
    }

    public List<TbTipoMidia> getTipoMidia() {
        return tipoMidia;
    }

}
