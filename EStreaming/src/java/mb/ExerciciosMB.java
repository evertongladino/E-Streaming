package mb;

import java.util.Date;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import dao.TbAssuntoDAO;
import dao.TbCompletarDAO;
import dao.TbDisciplinaDAO;
import dao.TbMultEscolhaDAO;
import dao.TbSomatorioDAO;
import dao.TbUsuarioDAO;
import dao.TbVfDAO;
import java.util.ArrayList;
import java.util.Calendar;
import model.Exercicio;
import model.TbAssunto;
import model.TbCompletar;
import model.TbDisciplina;
import model.TbMultEscolha;
import model.TbSomatorio;
import model.TbVF;

/**
*
* @author Guilherme
*/
@ManagedBean
@ViewScoped
public class ExerciciosMB {
	
	private TbAssunto selecionado;
	private List<TbAssunto> tbAssunto;
        private List<TbSomatorio> tbSomatorio;
        private List<TbMultEscolha> tbMultEscolha;
        private List<TbCompletar> tbCompletar;
        private List<TbVF> tbVF;
	private List<TbDisciplina> tbDisciplina;
        private List<Exercicio> exercicios = new ArrayList<>();
	private String txtTemaAssunto;
	
	 /**
     * Creates a new instance of AssuntoMB
     */
    public ExerciciosMB() {
        selecionado = new TbAssunto();
        txtTemaAssunto = "";
        
        filtrar();
    }
    
    public void buscarExercicios() {
        TbSomatorioDAO daoSomatorio = new TbSomatorioDAO();
        TbMultEscolhaDAO daoMultEscolha = new TbMultEscolhaDAO();
        TbCompletarDAO daoCompletar = new TbCompletarDAO();
        TbVfDAO daoVF = new TbVfDAO();
        
        tbSomatorio = daoSomatorio.consultarPorAssunto(selecionado.getIdtAssunto());
        tbMultEscolha = daoMultEscolha.consultarPorAssunto(selecionado.getIdtAssunto());
        tbCompletar = daoCompletar.consultarPorAssunto(selecionado.getIdtAssunto());
        tbVF = daoVF.consultarPorAssunto(selecionado.getIdtAssunto());
        
        for (TbSomatorio somatorio : tbSomatorio) {
            Exercicio e = new Exercicio();
            e.setEnunciadoQuestao(somatorio.getTxtEnunciado());
            e.setTpoQuestao(somatorio.getTbTipoQuestao().getIdtTipoQuestao());
            exercicios.add(e);
        }
        for (TbMultEscolha multEscolha : tbMultEscolha) {
            Exercicio e = new Exercicio();
            e.setEnunciadoQuestao(multEscolha.getTxtEnunciado());
            e.setTpoQuestao(multEscolha.getTbTipoQuestao().getIdtTipoQuestao());
            exercicios.add(e);
        }
        for (TbCompletar completar : tbCompletar) {
            Exercicio e = new Exercicio();
            e.setEnunciadoQuestao(completar.getTxtEnunciado());
            e.setTpoQuestao(completar.getTbTipoQuestao().getIdtTipoQuestao());
            exercicios.add(e);
        }
        for (TbVF vf : tbVF) {
            Exercicio e = new Exercicio();
            e.setEnunciadoQuestao(vf.getTxtEnunciado());
            e.setTpoQuestao(vf.getTbTipoQuestao().getIdtTipoQuestao());
            exercicios.add(e);
        }
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
        
        public List<TbSomatorio> getTbSomatorio() {
        return tbSomatorio;
        }

        public void setTbSomatorio(List<TbSomatorio> tbSomatorio) {
            this.tbSomatorio = tbSomatorio;
        }

        public List<TbMultEscolha> getTbMultEscolha() {
            return tbMultEscolha;
        }

        public void setTbMultEscolha(List<TbMultEscolha> tbMultEscolha) {
            this.tbMultEscolha = tbMultEscolha;
        }

        public List<TbCompletar> getTbCompletar() {
            return tbCompletar;
        }

        public void setTbCompletar(List<TbCompletar> tbCompletar) {
            this.tbCompletar = tbCompletar;
        }

        public List<TbVF> getTbVF() {
            return tbVF;
        }

        public void setTbVF(List<TbVF> tbVF) {
            this.tbVF = tbVF;
        }

        public List<Exercicio> getExercicios() {
            return exercicios;
        }

        public void setExercicios(List<Exercicio> exercicios) {
            this.exercicios = exercicios;
        }
	
}
