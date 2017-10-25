/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbCursoDAO;
import model.TbCurso;
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
public class CursoMB {

    private TbCurso selecionado;
    private List<TbCurso> tbCurso;
    private String nmeCurso;

    /**
     * Creates a new instance of ProdutoMB
     */
    public CursoMB() {
        selecionado = new TbCurso();
        nmeCurso = "";
        filtrar();
    }

    public void filtrar() {
        TbCursoDAO dao = new TbCursoDAO();
        setTbCurso(dao.consultarPorNme(getNmeCurso()));
    }

    public void novo() {
        setSelecionado(new TbCurso());
        getSelecionado().setIdtCurso(0);
        nmeCurso = "";
    }

    public void salvar() {
        TbCursoDAO dao = new TbCursoDAO();
        if (getSelecionado().getIdtCurso() == 0) {
            getSelecionado().setIdtCurso(0);
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

}
