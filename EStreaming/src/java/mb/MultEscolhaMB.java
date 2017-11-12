/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbAssuntoDAO;
import dao.TbMultEscolhaDAO;
import dao.TbTipoQuestaoDAO;
import model.TbMultEscolha;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import model.TbAssunto;
import model.TbTipoQuestao;

/**
 *
 * @author Hiragi
 */
@ManagedBean
@ViewScoped
public class MultEscolhaMB {

    private TbMultEscolha selecionado;
    private List<TbMultEscolha> tbMultEscolhas;
    private List<TbAssunto> assuntos;
    private List<TbTipoQuestao> tipoQuestoes;
    private Integer idtMultEscolha;
    private String txtEnunciado = "";

    /**
     * Creates a new instance of ProdutoMB
     */
    public MultEscolhaMB() {
        selecionado = new TbMultEscolha();
        idtMultEscolha = null;

        TbAssuntoDAO daoAssunto = new TbAssuntoDAO();
        assuntos = daoAssunto.consultarTodos();

        TbTipoQuestaoDAO daoRestaurante = new TbTipoQuestaoDAO();
        tipoQuestoes = daoRestaurante.consultarTodos();

        filtrar();
    }

    public void filtrar() {
        TbMultEscolhaDAO dao = new TbMultEscolhaDAO();
//        TbAssuntoDAO daoAssunto = new TbAssuntoDAO();
        setTbMultEscolhas(dao.consultarPorTxt(getTxtEnunciado(), "txtEnunciado"));
//        setTbMultEscolhas(dao.consultarPorIdt(getSelecionado().getIdtVf()));
//        setTbAssunto(daoAssunto.consultarPorTipoAssunto(getSelecionado().getTbAssunto().getIdtAssunto()));
    }

    public void novo() {
        setSelecionado(new TbMultEscolha());
        getSelecionado().setIdtMultEscolha(0);
        getSelecionado().setStsMultEscolha(true);
        txtEnunciado = "";
    }

    public void salvar() {
        TbMultEscolhaDAO dao = new TbMultEscolhaDAO();
        if (getSelecionado().getIdtMultEscolha() == null || getSelecionado().getIdtMultEscolha() == 0) {
            getSelecionado().setIdtMultEscolha(null);
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
        TbMultEscolhaDAO dao = new TbMultEscolhaDAO();
        if (getSelecionado().getIdtMultEscolha() != 0) {
            if (dao.excluir(getSelecionado().getIdtMultEscolha())) {
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
    public TbMultEscolha getSelecionado() {
        return selecionado;
    }

    public void setSelecionado(TbMultEscolha selecionado) {
        this.selecionado = selecionado;
    }

    public List<TbMultEscolha> getTbMultEscolhas() {
        return tbMultEscolhas;
    }

    public void setTbMultEscolhas(List<TbMultEscolha> tbMultEscolhas) {
        this.tbMultEscolhas = tbMultEscolhas;
    }

    public String getTxtEnunciado() {
        return txtEnunciado;
    }

    public void setTxtEnunciado(String txtEnunciado) {
        this.txtEnunciado = txtEnunciado;
    }

    /**
     * @return the tbAssuntos
     */
    public List<TbAssunto> getTbAssuntos() {
        return getAssuntos();
    }

    /**
     * @param tbAssuntos the tbAssuntos to set
     */
    public void setTbAssuntos(List<TbAssunto> tbAssuntos) {
        this.setAssuntos(tbAssuntos);
    }

    /**
     * @return the tbTipoQuestoes
     */
    public List<TbTipoQuestao> getTbTipoQuestoes() {
        return getTipoQuestoes();
    }

    /**
     * @param tbTipoQuestoes the tbTipoQuestoes to set
     */
    public void setTbTipoQuestoes(List<TbTipoQuestao> tbTipoQuestoes) {
        this.setTipoQuestoes(tbTipoQuestoes);
    }

    /**
     * @return the assuntos
     */
    public List<TbAssunto> getAssuntos() {
        return assuntos;
    }

    /**
     * @param assuntos the assuntos to set
     */
    public void setAssuntos(List<TbAssunto> assuntos) {
        this.assuntos = assuntos;
    }

    /**
     * @return the tipoQuestoes
     */
    public List<TbTipoQuestao> getTipoQuestoes() {
        return tipoQuestoes;
    }

    /**
     * @param tipoQuestoes the tipoQuestoes to set
     */
    public void setTipoQuestoes(List<TbTipoQuestao> tipoQuestoes) {
        this.tipoQuestoes = tipoQuestoes;
    }

}
