// */
// * To change this template, choose Tools | Templates
// * and open the template in the editor.
// */*/
// * To change this template, choose Tools | Templates
// * and open the template in the editor.
// */
package mb;

import dao.TbMultEscolhaDAO;
import java.util.Date;
import model.TbMultEscolha;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import model.TbAssunto;

/**
 *
 * @author Hiragi
 */


@ManagedBean
@ViewScoped
public class MultEscolhaMB {

    private TbMultEscolha selecionado;
    private List<TbMultEscolha> tbTipoQuestoes;
    private Integer idtMultEscolha;
    private TbAssunto tbAssunto;
    private TbMultEscolha tbMultEscolha;
    private String txtEnunciado;
    private boolean stsMultEscolha;
    private int ordMultEscolha;
    private Date dtaInsercao;
    private String vlrQuestao;
    private char flgFinalizada;

    /**
     * Creates a new instance of ProdutoMB
     */
    public MultEscolhaMB() {
        selecionado = new TbMultEscolha();
        idtMultEscolha = null;
        filtrar();
    }

    public void filtrar() {
        TbMultEscolhaDAO dao = new TbMultEscolhaDAO();
        setTbMultEscolha(dao.consultarPorIdt(getIdtMultEscolha()));
    }

    public void novo() {
        setSelecionado(new TbMultEscolha());
        getSelecionado().setIdtMultEscolha(0);
        idtMultEscolha = null;
    }

    public void salvar() {
        TbMultEscolhaDAO dao = new TbMultEscolhaDAO();
        if (getSelecionado().getIdtMultEscolha() == 0) {
            getSelecionado().setIdtMultEscolha(null);
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
        TbMultEscolhaDAO dao = new TbMultEscolhaDAO();
        if (getSelecionado().getIdtMultEscolha() != 0) {
            if (dao.excluir(getSelecionado().getIdtMultEscolha())) {
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
    public TbMultEscolha getSelecionado() {
        return selecionado;
    }

    /**
     * @param selecionado the selecionado to set
     */
    public void setSelecionado(TbMultEscolha selecionado) {
        this.selecionado = selecionado;
    }

    /**
     * @return the tbTipoQuestoes
     */
    public List<TbMultEscolha> getTbTipoQuestoes() {
        return tbTipoQuestoes;
    }

    /**
     * @param tbTipoQuestoes the tdMultEscolhaes to set
     */
    public void setTbMultEscolhaes(List<TbMultEscolha> tbTipoQuestoes) {
        this.tbTipoQuestoes = tbTipoQuestoes;
    }

    /**
     * @return the idtMultEscolha
     */
    public Integer getIdtMultEscolha() {
        return idtMultEscolha;
    }

    /**
     * @param idtMultEscolha the idtMultEscolha to set
     */
    public void setIdtMultEscolha(Integer idtMultEscolha) {
        this.idtMultEscolha = idtMultEscolha;
    }

    /**
     * @return the tbAssunto
     */
    public TbAssunto getTbAssunto() {
        return tbAssunto;
    }

    /**
     * @param tbAssunto the tbAssunto to set
     */
    public void setTbAssunto(TbAssunto tbAssunto) {
        this.tbAssunto = tbAssunto;
    }

    /**
     * @return the tbMultEscolha
     */
    public TbMultEscolha getTbMultEscolha() {
        return tbMultEscolha;
    }

    /**
     * @param tbMultEscolha the tbMultEscolha to set
     */
    public void setTbMultEscolha(TbMultEscolha tbMultEscolha) {
        this.tbMultEscolha = tbMultEscolha;
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
     * @return the stsMultEscolha
     */
    public boolean isStsMultEscolha() {
        return stsMultEscolha;
    }

    /**
     * @param stsMultEscolha the stsMultEscolha to set
     */
    public void setStsMultEscolha(boolean stsMultEscolha) {
        this.stsMultEscolha = stsMultEscolha;
    }

    /**
     * @return the ordMultEscolha
     */
    public int getOrdMultEscolha() {
        return ordMultEscolha;
    }

    /**
     * @param ordMultEscolha the ordMultEscolha to set
     */
    public void setOrdMultEscolha(int ordMultEscolha) {
        this.ordMultEscolha = ordMultEscolha;
    }

    /**
     * @return the dtaInsercao
     */
    public Date getDtaInsercao() {
        return dtaInsercao;
    }

    /**
     * @param dtaInsercao the dtaInsercao to set
     */
    public void setDtaInsercao(Date dtaInsercao) {
        this.dtaInsercao = dtaInsercao;
    }

    /**
     * @return the vlrQuestao
     */
    public String getVlrQuestao() {
        return vlrQuestao;
    }

    /**
     * @param vlrQuestao the vlrQuestao to set
     */
    public void setVlrQuestao(String vlrQuestao) {
        this.vlrQuestao = vlrQuestao;
    }

    /**
     * @return the flgFinalizada
     */
    public char getFlgFinalizada() {
        return flgFinalizada;
    }

    /**
     * @param flgFinalizada the flgFinalizada to set
     */
    public void setFlgFinalizada(char flgFinalizada) {
        this.flgFinalizada = flgFinalizada;
    }

}
