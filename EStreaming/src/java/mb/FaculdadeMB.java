/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbFaculdadeDAO;
import model.TbFaculdade;
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
public class FaculdadeMB {

    private TbFaculdade selecionado;
    private List<TbFaculdade> tbFaculdade;
    private String nmeFaculdade;

    /**
     * Creates a new instance of ProdutoMB
     */
    public FaculdadeMB() {
        selecionado = new TbFaculdade();
        nmeFaculdade = "";
        filtrar();
    }

    public void filtrar() {
        TbFaculdadeDAO dao = new TbFaculdadeDAO();
        setTbFaculdade(dao.consultarPorNme(getNmeFaculdade()));
    }

    public void novo() {
        setSelecionado(new TbFaculdade());
        getSelecionado().setIdtFaculdade(0);
        nmeFaculdade = "";
    }

    public void salvar() {
        TbFaculdadeDAO dao = new TbFaculdadeDAO();
        if (getSelecionado().getIdtFaculdade() == 0) {
            getSelecionado().setIdtFaculdade(null);
            dao.incluirFaculdade(getSelecionado());
        } else {
            dao.juntar(getSelecionado());
        }
        novo();
        filtrar();
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Resultado da Gravação", "Atualização efetivada na base de dados.");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void excluir() {
        TbFaculdadeDAO dao = new TbFaculdadeDAO();
        if (getSelecionado().getIdtFaculdade() != 0) {
            if (dao.excluir(getSelecionado().getIdtFaculdade())) {
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
    public TbFaculdade getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbFaculdade selecionado) {
        this.selecionado = selecionado;
    }

    public String getNmeFaculdade() {
        return nmeFaculdade;
    }

  
    public void setNmeFaculdade(String nmeFaculdade) {
        this.nmeFaculdade = nmeFaculdade;
    }

  
    public List<TbFaculdade> getTbFaculdade() {
        return tbFaculdade;
    }

    /**
     */
    public void setTbFaculdade(List<TbFaculdade> tbFaculdade) {
        this.tbFaculdade = tbFaculdade;
    }

}
