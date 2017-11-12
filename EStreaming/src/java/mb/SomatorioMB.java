/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbAssuntoDAO;
import dao.TbSomatorioDAO;
import dao.TbTipoQuestaoDAO;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import model.TbAssunto;
import model.TbSomatorio;
import model.TbTipoQuestao;


/**
 *
 * @author Hiragi
 */
@ManagedBean
@ViewScoped
public class SomatorioMB {

    private TbSomatorio selecionado;
    private List<TbSomatorio> tbSomatorios;
    private List<TbAssunto> assuntos;
    private List<TbTipoQuestao> tipoQuestoes;
    private Integer idtSomatorio;
    private String txtEnunciado = "";

    /**
     * Creates a new instance of ProdutoMB
     */
    public SomatorioMB() {
        selecionado = new TbSomatorio();
        idtSomatorio = null;

        TbAssuntoDAO daoAssunto = new TbAssuntoDAO();
        assuntos = daoAssunto.consultarTodos();

        TbTipoQuestaoDAO daoTipoQuestao = new TbTipoQuestaoDAO();
        tipoQuestoes = daoTipoQuestao.consultarTodos();

        filtrar();
    }

    public void filtrar() {
        TbSomatorioDAO dao = new TbSomatorioDAO();
        setTbSomatorios(dao.consultarPorTxt(getTxtEnunciado(), "txtEnunciado"));
    }

    public void novo() {
        setSelecionado(new TbSomatorio());
        getSelecionado().setIdtSomatorio(0);
        getSelecionado().setStsSomatorio(true);
        txtEnunciado = "";
    }

    public void salvar() {
        TbSomatorioDAO dao = new TbSomatorioDAO();
        if (getSelecionado().getIdtSomatorio() == null || getSelecionado().getIdtSomatorio()== 0) {
            getSelecionado().setIdtSomatorio(null);
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
        TbSomatorioDAO dao = new TbSomatorioDAO();
        if (getSelecionado().getIdtSomatorio()!= 0) {
            if (dao.excluir(getSelecionado().getIdtSomatorio())) {
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

    /**
     * @return the tbSomatorios
     */
    public List<TbSomatorio> getTbSomatorios() {
        return tbSomatorios;
    }

    /**
     * @param tbSomatorios the tbSomatorios to set
     */
    public void setTbSomatorios(List<TbSomatorio> tbSomatorios) {
        this.tbSomatorios = tbSomatorios;
    }

    /**
     * @return the idtSomatorio
     */
    public Integer getIdtSomatorio() {
        return idtSomatorio;
    }

    /**
     * @param idtSomatorio the idtSomatorio to set
     */
    public void setIdtSomatorio(Integer idtSomatorio) {
        this.idtSomatorio = idtSomatorio;
    }

    /**
     * @return the selecionado
     */
    public TbSomatorio getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbSomatorio selecionado) {
        this.selecionado = selecionado;
    }

}
