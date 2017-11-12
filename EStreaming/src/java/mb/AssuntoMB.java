package mb;

import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import dao.TbAssuntoDAO;
import dao.TbDisciplinaDAO;
import dao.TbUsuarioDAO;
import model.TbAssunto;
import model.TbDisciplina;

/**
*
* @author Guilherme
*/
@ManagedBean
@ViewScoped
public class AssuntoMB {
	
	private TbAssunto selecionado;
	private List<TbAssunto> tbAssunto;
	private List<TbDisciplina> tbDisciplina;

	private String txtTemaAssunto;
	
	 /**
     * Creates a new instance of AssuntoMB
     */
    public AssuntoMB() {
        selecionado = new TbAssunto();
        txtTemaAssunto = "";
        
        filtrar();
    }

    public void filtrar() {
        TbAssuntoDAO dao = new TbAssuntoDAO();
        TbDisciplinaDAO tbDisciplinaDAO = new TbDisciplinaDAO();
        setTbAssunto(dao.consultarporEnuniado(getTxtTemaAssunto()));
        setTbDisciplina(tbDisciplinaDAO.consultarTodos());
        
    }

    public void novo() {
        setSelecionado(new TbAssunto());
        getSelecionado().setIdtAssunto(0);
        txtTemaAssunto = "";
    }

    public void salvar() {
        TbAssuntoDAO dao = new TbAssuntoDAO();
        
        HttpSession sessao = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
        
        if (getSelecionado().getIdtAssunto() == 0) {
            getSelecionado().setIdtAssunto(0);
            getSelecionado().setDtaInsercao(new Date());
            getSelecionado().setCodUsuarioCriador((Integer) sessao.getAttribute("IDT_USUARIO"));
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
        TbAssuntoDAO dao = new TbAssuntoDAO();
        if (getSelecionado().getIdtAssunto() != 0) {
            if (dao.excluir(getSelecionado().getIdtAssunto())) {
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
	
	public TbAssunto getSelecionado() {
		return selecionado;
	}
	
	public void setSelecionado(TbAssunto selecionado) {
		this.selecionado = selecionado;
	}
	
	public List<TbAssunto> getTbAssunto() {
		return tbAssunto;
	}
	
	public void setTbAssunto(List<TbAssunto> tbAssunto) {
		this.tbAssunto = tbAssunto;
	}
	
	public String getTxtTemaAssunto() {
		return txtTemaAssunto;
	}
	
	public void setTxtTemaAssunto(String txtTemaAssunto) {
		this.txtTemaAssunto = txtTemaAssunto;
	}
	
	public List<TbDisciplina> getTbDisciplina() {
		return tbDisciplina;
	}

	public void setTbDisciplina(List<TbDisciplina> tbDisciplina) {
		this.tbDisciplina = tbDisciplina;
	}
	
}
