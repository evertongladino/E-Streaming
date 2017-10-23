/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbTipoQuestaoDAO;
import model.TbTipoQuestao;
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
public class TipoQuestaoMB {

    private TbTipoQuestao selecionado;
    private List<TbTipoQuestao> tbTipoQuestoes;
    private String nmeTipoQuestao;

    /**
     * Creates a new instance of ProdutoMB
     */
    public TipoQuestaoMB() {
        selecionado = new TbTipoQuestao();
        nmeTipoQuestao = "";
        filtrar();
    }

    public void filtrar() {
        TbTipoQuestaoDAO dao = new TbTipoQuestaoDAO();
        setTbTipoQuestaoes(dao.consultarPorNme(getNmeTipoQuestao()));
    }

    public void novo() {
        setSelecionado(new TbTipoQuestao());
        getSelecionado().setIdtTipoQuestao(0);
        nmeTipoQuestao = "";
    }

    public void salvar() {
        TbTipoQuestaoDAO dao = new TbTipoQuestaoDAO();
        if (getSelecionado().getIdtTipoQuestao() == 0) {
            getSelecionado().setIdtTipoQuestao(null);
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
        TbTipoQuestaoDAO dao = new TbTipoQuestaoDAO();
        if (getSelecionado().getIdtTipoQuestao() != 0) {
            if (dao.excluir(getSelecionado().getIdtTipoQuestao())) {
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
    public TbTipoQuestao getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbTipoQuestao selecionado) {
        this.selecionado = selecionado;
    }

    /**
     * @return the nmeTipoQuestao
     */
    public String getNmeTipoQuestao() {
        return nmeTipoQuestao;
    }

    /**
     * @param nmeTipoQuestao the nmeTipoQuestao to set
     */
    public void setNmeTipoQuestao(String nmeTipoQuestao) {
        this.nmeTipoQuestao = nmeTipoQuestao;
    }

    /**
     * @return the tbTipoQuestoes
     */
    public List<TbTipoQuestao> getTbTipoQuestoes() {
        return tbTipoQuestoes;
    }

    /**
     * @param tbTipoQuestoes the tdTipoQuestaoes to set
     */
    public void setTbTipoQuestaoes(List<TbTipoQuestao> tbTipoQuestoes) {
        this.tbTipoQuestoes = tbTipoQuestoes;
    }

}
