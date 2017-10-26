/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbDisciplinaDAO;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import model.TbDisciplina;

/**
 *
 * @author Guilherme
 */
@ManagedBean
@ViewScoped
public class DisciplinaMB {

    private TbDisciplina selecionado;
    private List<TbDisciplina> tbDisciplina;
    private String nmeDisciplina;

    /**
     * Creates a new instance of ProdutoMB
     */
    public DisciplinaMB() {
        selecionado = new TbDisciplina();
        nmeDisciplina = "";
        
        filtrar();
    }

    public void filtrar() {
        TbDisciplinaDAO dao = new TbDisciplinaDAO();
        setTbDisciplina(dao.consultarPorNme(getNmeDisciplina()));
    }

    public void novo() {
        setSelecionado(new TbDisciplina());
        getSelecionado().setIdtDisciplina(0);
        nmeDisciplina = "";
    }

    public void salvar() {
        TbDisciplinaDAO dao = new TbDisciplinaDAO();
        if (getSelecionado().getIdtDisciplina() == 0) {
            getSelecionado().setIdtDisciplina(0);
            dao.incluirDisciplina(getSelecionado());
        } else {
            dao.juntar(getSelecionado());
        }
        novo();
        filtrar();
        FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Resultado da Gravação", "Atualização efetivada na base de dados.");
        FacesContext.getCurrentInstance().addMessage(null, msg);
    }

    public void excluir() {
        TbDisciplinaDAO dao = new TbDisciplinaDAO();
        if (getSelecionado().getIdtDisciplina() != 0) {
            if (dao.excluir(getSelecionado().getIdtDisciplina())) {
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
    public TbDisciplina getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbDisciplina selecionado) {
        this.selecionado = selecionado;
    }

    /**
     * @return the cpfUsuario
     */
    public String getNmeDisciplina() {
        return nmeDisciplina;
    }

    /**
     * @param cpfUsuario the cpfUsuario to set
     */
    public void setNmeDisciplina(String nmeDisciplina) {
        this.nmeDisciplina = nmeDisciplina;
    }

    /**
     * @return the tbUsuario
     */
    public List<TbDisciplina> getTbDisciplina() {
        return tbDisciplina;
    }

    /**
     * @param tbUsuario the tbUsuario to set
     */
    public void setTbDisciplina(List<TbDisciplina> tbDisciplina) {
        this.tbDisciplina = tbDisciplina;
    }

}
