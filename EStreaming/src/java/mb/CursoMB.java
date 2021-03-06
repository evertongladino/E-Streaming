/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbCursoDAO;
import dao.TbFaculdadeDAO;
import model.TbCurso;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import model.TbFaculdade;

/**
 *
 * @author Hiragi
 */
@ManagedBean
@ViewScoped
public class CursoMB {

    private TbCurso selecionado;
    private List<TbCurso> tbCurso;
    private List<TbFaculdade> tbFaculdade;
    private String nmeFaculdade;

    
    

    /**
     * Creates a new instance of ProdutoMB
     */
    public CursoMB() {
        selecionado = new TbCurso();
        nmeCurso = "";
        getSelecionado().setStsCurso(true);
        filtrar();
    }

    public void filtrar() {
        TbCursoDAO dao = new TbCursoDAO();
        TbFaculdadeDAO daoFaculdade = new TbFaculdadeDAO();
        setTbCurso(dao.consultarPorNme(getNmeCurso()));
        setTbFaculdade(daoFaculdade.consultarTodos());
    }

    public void novo() {
        setSelecionado(new TbCurso());
        getSelecionado().setIdtCurso(0);
        getSelecionado().setStsCurso(true);
        nmeCurso = "";
    }

    public void salvar() {
        TbCursoDAO dao = new TbCursoDAO();
        if (getSelecionado().getIdtCurso() == 0) {
            //getSelecionado().setIdtCurso(0);
            getSelecionado().setDtaInsercao(new java.util.Date());
            dao.incluirCurso(getSelecionado());
        } else {
            dao.juntar(getSelecionado());
        }
        novo();
        filtrar();
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Resultado da Gravação", "Atualização efetivada na base de dados.");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void excluir() {
       try{ 
        TbCursoDAO dao = new TbCursoDAO();
        if (getSelecionado().getIdtCurso() != 0) {
            if (dao.excluir(getSelecionado().getIdtCurso())) {
                FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Resultado da Exclusão", "Exclusão efetuada com sucesso.");
                FacesContext.getCurrentInstance().addMessage(null, msg);
            } else {
                FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Resultado da Exclusao", "Não foi possível excluir.");
                FacesContext.getCurrentInstance().addMessage(null, msg);
            }
        }
        novo();
        filtrar();
       }catch (Exception e) {
            FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Resultado da Exclusão", "Não posso excluir faculdade pois existe objetos associados.");
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
    }

    /**
     * @return the selecionado
     */
    public TbCurso getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbCurso selecionado) {
        this.selecionado = selecionado;
    }

    public String getNmeCurso() {
        return nmeCurso;
    }

  
    public void setNmeCurso(String nmeCurso) {
        this.nmeCurso = nmeCurso;
    }

  
    public List<TbCurso> getTbCurso() {
        return tbCurso;
    }

    /**
     */
    public void setTbCurso(List<TbCurso> tbCurso) {
        this.tbCurso = tbCurso;
    }
public List<TbFaculdade> getTbFaculdade() {
        return tbFaculdade;
    }

    public void setTbFaculdade(List<TbFaculdade> tbFaculdade) {
        this.tbFaculdade = tbFaculdade;
    }
    private String nmeCurso;
    
    public String getNmeFaculdade() {
        return nmeFaculdade;
    }

    public void setNmeFaculdade(String nmeFaculdade) {
        this.nmeFaculdade = nmeFaculdade;
    }
}
