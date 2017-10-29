/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbAssuntoDAO;
import dao.TbTipoQuestaoDAO;
import dao.TbVfDAO;
import java.util.Date;
import model.TbVF;
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
public class VfMB {
    
    private TbVF selecionado;
    private List<TbVF> tbVfs;
    private List<TbAssunto> assuntos;
    private List<TbTipoQuestao> tipoQuestoes;
    private Integer idtVf;
    private String txtEnunciado = "";


    /**
     * Creates a new instance of ProdutoMB
     */
    public VfMB() {
        selecionado = new TbVF();
        idtVf = null;
        
        TbAssuntoDAO daoAssunto = new TbAssuntoDAO();
        assuntos = daoAssunto.consultarTodos();
        
        TbTipoQuestaoDAO daoRestaurante = new TbTipoQuestaoDAO();
        tipoQuestoes = daoRestaurante.consultarTodos();
        
        filtrar();
    }

    public void filtrar() {
        TbVfDAO dao = new TbVfDAO();
        setTbVfs(dao.consultarPorTxt(getTxtEnunciado(), "txtEnunciado"));
    }

    public void novo() {
        setSelecionado(new TbVF());
        getSelecionado().setIdtVf(0);
        txtEnunciado = "";
    }

    public void salvar() {
        TbVfDAO dao = new TbVfDAO();
        if (getSelecionado().getIdtVf()== 0) {
            getSelecionado().setDtaInsercao(new Date());
            getSelecionado().setFlgFinalizada('N');
            getSelecionado().setIdtVf(null);
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
        TbVfDAO dao = new TbVfDAO();
        if (getSelecionado().getIdtVf()!= 0) {
            if (dao.excluirVF(getSelecionado().getIdtVf())) {
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
    
    public TbVF getSelecionado() {
        return selecionado;
    }

    public void setSelecionado(TbVF selecionado) {
        this.selecionado = selecionado;
    }

    public List<TbVF> getTbVfs() {
        return tbVfs;
    }

    public void setTbVfs(List<TbVF> tbVfs) {
        this.tbVfs = tbVfs;
    }

    public Integer getIdtVf() {
        return idtVf;
    }

    public void setIdtVf(Integer idtVf) {
        this.idtVf = idtVf;
    }

    public String getTxtEnunciado() {
        return txtEnunciado;
    }

    public void setTxtEnunciado(String txtEnunciado) {
        this.txtEnunciado = txtEnunciado;
    }
    
    public List<TbAssunto> getAssuntos() {
        return assuntos;
    }

    public void setAssuntos(List<TbAssunto> assuntos) {
        this.assuntos = assuntos;
    }

    public List<TbTipoQuestao> getTipoQuestoes() {
        return tipoQuestoes;
    }

    public void setTipoQuestoes(List<TbTipoQuestao> tipoQuestoes) {
        this.tipoQuestoes = tipoQuestoes;
    }
}
