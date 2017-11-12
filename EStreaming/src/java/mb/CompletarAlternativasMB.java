/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbCompletarAlternativasDAO;
import dao.TbCompletarDAO;
import model.TbCompletar;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import model.TbCompletarAlternativas;


/**
 *
 * @author José Lisboa
 */
@ManagedBean
@ViewScoped
public class CompletarAlternativasMB {

    private TbCompletarAlternativas selecionado;
    private Integer idtCompletarAlternativas;
    private List<TbCompletarAlternativas> tbCompletarAlternativas;
    private List<TbCompletar> tbCompletar;
    private Integer ordCompletarAlternativas;
    private String txtPalavra;

    /**
     * Creates a new instance of CompletarAlternativasMB
     */
    public CompletarAlternativasMB() {
        selecionado = new TbCompletarAlternativas();
        idtCompletarAlternativas = null;
        
        
        TbCompletarDAO daoTbCompletar = new TbCompletarDAO();
        tbCompletar = daoTbCompletar.consultarTodos();
        
        filtrar();
    }

    public void filtrar() {
        TbCompletarAlternativasDAO dao = new TbCompletarAlternativasDAO();
        setTbCompletarAlternativas(dao.consultarPorPalavra(getTxtPalavra()));
    }
    
    public void filtrarID() {
        TbCompletarAlternativasDAO dao = new TbCompletarAlternativasDAO();
        
    }

    public void novo() {
        setSelecionado(new TbCompletarAlternativas());
        getSelecionado().setIdtCompletarAlternativas(0);
        getSelecionado().setStsCompletarAlternativas(true);
        txtPalavra = "";
        

    }

    public void salvar() {
        TbCompletarAlternativasDAO dao = new TbCompletarAlternativasDAO();
        if (getSelecionado().getIdtCompletarAlternativas() == 0) {
            getSelecionado().setIdtCompletarAlternativas(null);
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
        if (getSelecionado().getIdtCompletarAlternativas() != 0) {
            if (dao.excluir(getSelecionado().getIdtCompletarAlternativas())) {
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

    public TbCompletarAlternativas getSelecionado() {
        return selecionado;
    }

    public Integer getIdtCompletarAlternativas() {
        return idtCompletarAlternativas;
    }

    public List<TbCompletarAlternativas> getTbCompletarAlternativas() {
        return tbCompletarAlternativas;
    }

    public List<TbCompletar> getTbCompletar() {
        return tbCompletar;
    }

    public Integer getOrdCompletarAlternativas() {
        return ordCompletarAlternativas;
    }

    public String getTxtPalavra() {
        return txtPalavra;
    }

    public void setSelecionado(TbCompletarAlternativas selecionado) {
        this.selecionado = selecionado;
    }
    
    public void setTbCompletarAlternativas(List<TbCompletarAlternativas> tbCompletarAlternativas) {
        this.tbCompletarAlternativas = tbCompletarAlternativas;
    }

    public void setIdtCompletarAlternativas(Integer idtCompletarAlternativas) {
        this.idtCompletarAlternativas = idtCompletarAlternativas;
    }

    public void setTbCompletar(List<TbCompletar> tbCompletar) {
        this.tbCompletar = tbCompletar;
    }

    public void setOrdCompletarAlternativas(Integer ordCompletarAlternativas) {
        this.ordCompletarAlternativas = ordCompletarAlternativas;
    }

    public void setTxtPalavra(String txtPalavra) {
        this.txtPalavra = txtPalavra;
    }    
}
