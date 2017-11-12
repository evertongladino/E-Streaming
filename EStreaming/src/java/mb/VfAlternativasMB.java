/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbVfAlternativasDAO;
import dao.TbVfDAO;
import model.TbVF;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import model.TbVFAlternativas;

/**
 *
 * @author Hiragi
 */
@ManagedBean
@ViewScoped
public class VfAlternativasMB {
    
    private TbVFAlternativas selecionado;
    private List<TbVFAlternativas> tbVfAlternativas;
    private List<TbVF> Vfs;
    private Integer idtVfAlternativas;
    private String txtItem = "";


    /**
     * Creates a new instance of ProdutoMB
     */
    public VfAlternativasMB() {
        selecionado = new TbVFAlternativas();
        idtVfAlternativas = null;
        
        TbVfDAO daoVFs = new TbVfDAO();
        Vfs = daoVFs.consultarTodos();        
        
        filtrar();
    }

    public void filtrar() {
        TbVfAlternativasDAO dao = new TbVfAlternativasDAO();
        setTbVfAlternativas(dao.consultarPorTxt(getTxtItem(), "txtItem"));
    }
    

    public void novo() {
        setSelecionado(new TbVFAlternativas());
        getSelecionado().setIdtVFAlternativas(0);
        txtItem = "";
    }

    public void salvar() {
        TbVfAlternativasDAO dao = new TbVfAlternativasDAO();
        if (getSelecionado().getIdtVFAlternativas()== null || getSelecionado().getIdtVFAlternativas()== 0) {
            getSelecionado().setIdtVFAlternativas(null);
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
        TbVfAlternativasDAO dao = new TbVfAlternativasDAO();
        if (getSelecionado().getIdtVFAlternativas()!= 0) {
            if (dao.excluirVFAlternativa(getSelecionado().getIdtVFAlternativas())) {
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
    public TbVFAlternativas getSelecionado() {
        return selecionado;
    }

    public void setSelecionado(TbVFAlternativas selecionado) {
        this.selecionado = selecionado;
    }

    public List<TbVFAlternativas> getTbVfAlternativas() {
        return tbVfAlternativas;
    }

    public void setTbVfAlternativas(List<TbVFAlternativas> tbVfAlternativas) {
        this.tbVfAlternativas = tbVfAlternativas;
    }

    public List<TbVF> getVfs() {
        return Vfs;
    }

    public void setVfs(List<TbVF> Vfs) {
        this.Vfs = Vfs;
    }

    public Integer getIdtVfAlternativas() {
        return idtVfAlternativas;
    }

    public void setIdtVfAlternativas(Integer idtVfAlternativas) {
        this.idtVfAlternativas = idtVfAlternativas;
    }

    public String getTxtItem() {
        return txtItem;
    }

    public void setTxtItem(String txtItem) {
        this.txtItem = txtItem;
    }

}
