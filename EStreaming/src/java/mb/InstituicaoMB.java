/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbInstituicaoDAO;
import model.TbInstituicao;
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
public class InstituicaoMB {

    private TbInstituicao selecionado;
    private List<TbInstituicao> tbInstituicao;
    private String nmeInstituicao;

    /**
     * Creates a new instance of ProdutoMB
     */
    public InstituicaoMB() {
        selecionado = new TbInstituicao();
        getSelecionado().getNmeInstituicao();
        getSelecionado().setStsInstituicao(true);
        nmeInstituicao = "";
        filtrar();
    }

    public void filtrar() {
        TbInstituicaoDAO dao = new TbInstituicaoDAO();
        setTbInstituicao(dao.consultarPorNme(getNmeInstituicao()));
    }

    public void novo() {
        setSelecionado(new TbInstituicao());
        getSelecionado().setIdtInstituicao(0);
        getSelecionado().setStsInstituicao(true);
        nmeInstituicao = "";
    }

    public void salvar() {
        TbInstituicaoDAO dao = new TbInstituicaoDAO();
        if (getSelecionado().getIdtInstituicao() == null || getSelecionado().getIdtInstituicao() == 0) {
            getSelecionado().setIdtInstituicao(0);
            getSelecionado().setDtaInsercao(new java.util.Date());
            dao.incluirInstituicao(getSelecionado());
        } else {
            dao.juntar(getSelecionado());
        }
        novo();
        filtrar();
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Resultado da Gravação", "Atualização efetivada na base de dados.");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void excluir() {
        try {
        TbInstituicaoDAO dao = new TbInstituicaoDAO();
        if (getSelecionado().getIdtInstituicao() != 0) {
            if (dao.excluir(getSelecionado().getIdtInstituicao())) {
                FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Resultado da Exclusão", "Exclusão efetuada com sucesso.");
                FacesContext.getCurrentInstance().addMessage(null, msg);
            } else {
                FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Resultado da Exclusao", "Não foi possível excluir.");
                FacesContext.getCurrentInstance().addMessage(null, msg);
            }
        }
        novo();
        filtrar();
        } catch (Exception e) {
            FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Resultado da Exclusão", "Não posso excluir faculdade pois existe objetos associados.");
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
    }

    /**
     * @return the selecionado
     */
    public TbInstituicao getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbInstituicao selecionado) {
        this.selecionado = selecionado;
    }

    public String getNmeInstituicao() {
        return nmeInstituicao;
    }

  
    public void setNmeInstituicao(String nmeInstituicao) {
        this.nmeInstituicao = nmeInstituicao;
    }

  
    public List<TbInstituicao> getTbInstituicao() {
        return tbInstituicao;
    }

    /**
     */
    public void setTbInstituicao(List<TbInstituicao> tbInstituicao) {
        this.tbInstituicao = tbInstituicao;
    }

}
