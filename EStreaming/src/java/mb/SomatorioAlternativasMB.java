/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;

import dao.TbSomatorioAlternativasDAO;
import dao.TbSomatorioDAO;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import model.TbSomatorio;
import model.TbSomatorioAlternativas;


/**
 *
 * @author Hiragi
 */
@ManagedBean
@ViewScoped
public class SomatorioAlternativasMB {

    private TbSomatorioAlternativas selecionado;
    private List<TbSomatorioAlternativas> tbSomatorioAlternativass;
    private List<TbSomatorio> somatorios;
    private Integer idtSomatorioAlternativas;
    private String txtItem = "";

    /**
     * Creates a new instance of ProdutoMB
     */
    public SomatorioAlternativasMB() {
        selecionado = new TbSomatorioAlternativas();
        idtSomatorioAlternativas = null;

        TbSomatorioDAO daoSomatorio = new TbSomatorioDAO();
        somatorios = daoSomatorio.consultarTodos();

        filtrar();
    }

    public void filtrar() {
        TbSomatorioAlternativasDAO dao = new TbSomatorioAlternativasDAO();
        setTbSomatorioAlternativass(dao.consultarPorTxt(getTxtItem(), "txtItem"));
    }

    public void novo() {
        setSelecionado(new TbSomatorioAlternativas());
        getSelecionado().setIdtSomatorioAlternativas(0);
        getSelecionado().setStsSomatorioAlternativas(true);
        txtItem = "";
    }

    public void salvar() {
        TbSomatorioAlternativasDAO dao = new TbSomatorioAlternativasDAO();
        if (getSelecionado().getIdtSomatorioAlternativas()== 0) {
            getSelecionado().setIdtSomatorioAlternativas(null);
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
        TbSomatorioAlternativasDAO dao = new TbSomatorioAlternativasDAO();
        if (getSelecionado().getIdtSomatorioAlternativas()!= 0) {
            if (dao.excluir(getSelecionado().getIdtSomatorioAlternativas())) {
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
    public TbSomatorioAlternativas getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbSomatorioAlternativas selecionado) {
        this.selecionado = selecionado;
    }

    /**
     * @return the tbSomatorioAlternativass
     */
    public List<TbSomatorioAlternativas> getTbSomatorioAlternativass() {
        return tbSomatorioAlternativass;
    }

    /**
     * @param tbSomatorioAlternativass the tbSomatorioAlternativass to set
     */
    public void setTbSomatorioAlternativass(List<TbSomatorioAlternativas> tbSomatorioAlternativass) {
        this.tbSomatorioAlternativass = tbSomatorioAlternativass;
    }

    /**
     * @return the somatorios
     */
    public List<TbSomatorio> getSomatorios() {
        return somatorios;
    }

    /**
     * @param somatorios the somatorios to set
     */
    public void setSomatorios(List<TbSomatorio> somatorios) {
        this.somatorios = somatorios;
    }

    /**
     * @return the idtSomatorioAlternativas
     */
    public Integer getIdtSomatorioAlternativas() {
        return idtSomatorioAlternativas;
    }

    /**
     * @param idtSomatorioAlternativas the idtSomatorioAlternativas to set
     */
    public void setIdtSomatorioAlternativas(Integer idtSomatorioAlternativas) {
        this.idtSomatorioAlternativas = idtSomatorioAlternativas;
    }

    /**
     * @return the txtItem
     */
    public String getTxtItem() {
        return txtItem;
    }

    /**
     * @param txtItem the txtItem to set
     */
    public void setTxtItem(String txtItem) {
        this.txtItem = txtItem;
    }


}
