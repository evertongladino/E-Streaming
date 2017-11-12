/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbAssuntoDAO;
import dao.TbCompletarDAO;
import dao.TbTipoQuestaoDAO;
import model.TbCompletar;
import java.util.Date;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import model.TbAssunto;
import model.TbTipoQuestao;


/**
 *
 * @author José Lisboa
 */
@ManagedBean
@ViewScoped
public class CompletarMB {

    private TbCompletar selecionado;
    private Integer idtCompletar;
    private List<TbCompletar> tbCompletar;
    private List<TbTipoQuestao> tipoQuestoes;
    private List<TbAssunto> tbAssunto;
    private String txtEnunciado = "";
    private Integer qtdCampos;
    private String txtFrase;
    private Date dtaInsercao;
    private char flgFinalizada;

    /**
     * Creates a new instance of CompletarMB
     */
    public CompletarMB() {
        selecionado = new TbCompletar();
        idtCompletar = null;
        
        TbAssuntoDAO daoAssunto = new TbAssuntoDAO();
        tbAssunto = daoAssunto.consultarTodos();
        
        TbTipoQuestaoDAO daoTipoQuestao = new TbTipoQuestaoDAO();
        tipoQuestoes = daoTipoQuestao.consultarTodos();
        
        filtrar();
    }

    public void filtrar() {
        TbCompletarDAO dao = new TbCompletarDAO();
        setTbCompletar(dao.consultarPorFrase(getTxtFrase()));
    }

    public void novo() {
        setSelecionado(new TbCompletar());
        getSelecionado().setIdtCompletar(0);
        getSelecionado().setStsCompletar(true);
        txtEnunciado = "";
        txtFrase = "";
        qtdCampos = null;

    }

    public void salvar() {
        TbCompletarDAO dao = new TbCompletarDAO();
        if (getSelecionado().getIdtCompletar() == 0) {
            getSelecionado().setIdtCompletar(null);
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
        TbCompletarDAO dao = new TbCompletarDAO();
        if (getSelecionado().getIdtCompletar() != 0) {
            if (dao.excluir(getSelecionado().getIdtCompletar())) {
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
    public TbCompletar getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbCompletar selecionado) {
        this.selecionado = selecionado;
    }
    
    public void setIdtCompletar(Integer idtCompletar) {
        this.idtCompletar = idtCompletar;
    }

    public Integer getIdtCompletar() {
        return idtCompletar;
    }

    /**
     * @return the txtEnunciado
     */
    public String getTxtEnunciado() {
        return txtEnunciado;
    }

    /**
     * @param txtEnunciado the txtEnunciado to set
     */
    public void setTxtEnunciado(String txtEnunciado) {
        this.txtEnunciado = txtEnunciado;
    }

    /**
     * @return the tbCompletar
     */
    public List<TbCompletar> getTbCompletar() {
        return tbCompletar;
    }

    /**
     * @param tbCompletar the tbCompletar to set
     */
    public void setTbCompletar(List<TbCompletar> tbCompletar) {
        this.tbCompletar = tbCompletar;
    }
    
        public Integer getQtdCampos() {
        return qtdCampos;
    }

    public String getTxtFrase() {
        return txtFrase;
    }

    public List<TbAssunto> getTbAssunto() {
        return tbAssunto;
    }

    public Date getDtaInsercao() {
        return dtaInsercao;
    }

    public char getFlgFinalizada() {
        return flgFinalizada;
    }

    public void setQtdCampos(Integer qtdCampos) {
        this.qtdCampos = qtdCampos;
    }

    public void setTxtFrase(String txtFrase) {
        this.txtFrase = txtFrase;
    }

    public void setTbAssunto(List<TbAssunto> tbAssunto) {
        this.tbAssunto = tbAssunto;
    }
    
     public void setTipoQuestoes(List<TbTipoQuestao> tipoQuestoes) {
        this.tipoQuestoes = tipoQuestoes;
    }

    public List<TbTipoQuestao> getTipoQuestoes() {
        return tipoQuestoes;
    }

    public void setDtaInsercao(Date dtaInsercao) {
        this.dtaInsercao = dtaInsercao;
    }

    public void setFlgFinalizada(char flgFinalizada) {
        this.flgFinalizada = flgFinalizada;
    }

}
