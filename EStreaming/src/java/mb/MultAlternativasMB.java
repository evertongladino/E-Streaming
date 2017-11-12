/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mb;


import dao.TbMultAlternativasDAO;
import dao.TbMultEscolhaDAO;
import model.TbMultEscolha;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import model.TbMultAlternativas;
/**
 *
 * @author Hiragi
 */
@ManagedBean
@ViewScoped
public class MultAlternativasMB {

    private TbMultAlternativas selecionado;
    private List<TbMultAlternativas> tbMultAlternativass;
    private List<TbMultEscolha> multEscolhas;
    private Integer idtMultAlternativas;
    private String txtItem = "";

    /**
     * Creates a new instance of ProdutoMB
     */
    public MultAlternativasMB() {
        selecionado = new TbMultAlternativas();
        idtMultAlternativas = null;

        TbMultEscolhaDAO daoMultEscolha = new TbMultEscolhaDAO();
        multEscolhas = daoMultEscolha.consultarTodos();

        filtrar();
    }

    public void filtrar() {
        TbMultAlternativasDAO dao = new TbMultAlternativasDAO();
        setTbMultAlternativass(dao.consultarPorTxt(getTxtItem(), "txtItem"));
    }

    public void novo() {
        setSelecionado(new TbMultAlternativas());
        getSelecionado().setIdtAlternativas(0);
        getSelecionado().setStsMultAlternativas(true);
        txtItem = "";
    }

    public void salvar() {
        TbMultAlternativasDAO dao = new TbMultAlternativasDAO();
        if (getSelecionado().getIdtAlternativas()== null || getSelecionado().getIdtAlternativas()== 0) {
            getSelecionado().setIdtAlternativas(null);
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
        TbMultAlternativasDAO dao = new TbMultAlternativasDAO();
        if (getSelecionado().getIdtAlternativas()!= 0) {
            if (dao.excluir(getSelecionado().getIdtAlternativas())) {
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
    public TbMultAlternativas getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbMultAlternativas selecionado) {
        this.selecionado = selecionado;
    }

    /**
     * @return the tbMultAlternativas
     */

    /**
     * @return the multEscolhas
     */
    public List<TbMultEscolha> getMultEscolhas() {
        return multEscolhas;
    }

    /**
     * @param multEscolhas the multEscolhas to set
     */
    public void setMultEscolhas(List<TbMultEscolha> multEscolhas) {
        this.multEscolhas = multEscolhas;
    }

    /**
     * @return the idtMultAlternativas
     */
    public Integer getIdtMultAlternativas() {
        return idtMultAlternativas;
    }

    /**
     * @param idtMultAlternativas the idtMultAlternativas to set
     */
    public void setIdtMultAlternativas(Integer idtMultAlternativas) {
        this.idtMultAlternativas = idtMultAlternativas;
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

    /**
     * @return the tbMultAlternativass
     */
    public List<TbMultAlternativas> getTbMultAlternativass() {
        return tbMultAlternativass;
    }

    /**
     * @param tbMultAlternativass the tbMultAlternativass to set
     */
    public void setTbMultAlternativass(List<TbMultAlternativas> tbMultAlternativass) {
        this.tbMultAlternativass = tbMultAlternativass;
    }

}
