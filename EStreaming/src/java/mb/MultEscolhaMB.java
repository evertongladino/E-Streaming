// */
// * To change this template, choose Tools | Templates
// * and open the template in the editor.
// */*/
// * To change this template, choose Tools | Templates
// * and open the template in the editor.
// */
package mb;

import dao.TbAssuntoDAO;
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
    private List<TbMultEscolha> tbMultEscolhas;
    private String txtEnunciado;

    /**
     * Creates a new instance of ProdutoMB
     */
    public MultEscolhaMB() {
        selecionado = new TbMultEscolha();
        txtEnunciado = "";
        filtrar();
    }

    public void filtrar() {
        TbMultEscolhaDAO dao = new TbMultEscolhaDAO();
        //TbAssuntoDAO daoAssunto = new TbAssuntoDAO();
        setTbMultEscolhas(dao.consultarPorTxt(getTxtEnunciado(), "txtEnunciado"));
        //setTbAssunto(daoAssunto.consultarPorTipoAssunto(getSelecionado().getTbAssunto().getIdtAssunto()));
    }

    public void novo() {
        setSelecionado(new TbMultEscolha());
        getSelecionado().setIdtMultEscolha(0);
        txtEnunciado = "";
        
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
    public List<TbMultEscolha> getTbtbMultEscolhas() {
        return tbMultEscolhas;
    }

//    /**
//     * @param tbTipoQuestoes the tdMultEscolhaes to set
//     */
    public void setTbMultEscolhas(List<TbMultEscolha> tbtbMultEscolhas) {
        this.tbMultEscolhas = tbtbMultEscolhas;
    }

    /**
     * @return the idtMultEscolha
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
}
