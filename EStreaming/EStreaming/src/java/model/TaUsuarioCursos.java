package model;
// Generated 21/10/2017 10:26:18 by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * TaUsuarioCursos generated by hbm2java
 */
@Entity
@Table(name="ta_usuario_cursos"
    ,catalog="estreaming"
)
public class TaUsuarioCursos  implements java.io.Serializable {


     private TaUsuarioCursosId id;
     private TbCurso tbCurso;
     private TbUsuario tbUsuario;
     private boolean stsUsuarioCursos;
     private Date dtaInsercao;

    public TaUsuarioCursos() {
    }

    public TaUsuarioCursos(TaUsuarioCursosId id, TbCurso tbCurso, TbUsuario tbUsuario, boolean stsUsuarioCursos, Date dtaInsercao) {
       this.id = id;
       this.tbCurso = tbCurso;
       this.tbUsuario = tbUsuario;
       this.stsUsuarioCursos = stsUsuarioCursos;
       this.dtaInsercao = dtaInsercao;
    }
   
     @EmbeddedId

    
    @AttributeOverrides( {
        @AttributeOverride(name="codCurso", column=@Column(name="cod_curso", nullable=false) ), 
        @AttributeOverride(name="codUsuario", column=@Column(name="cod_usuario", nullable=false) ) } )
    public TaUsuarioCursosId getId() {
        return this.id;
    }
    
    public void setId(TaUsuarioCursosId id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cod_curso", nullable=false, insertable=false, updatable=false)
    public TbCurso getTbCurso() {
        return this.tbCurso;
    }
    
    public void setTbCurso(TbCurso tbCurso) {
        this.tbCurso = tbCurso;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cod_usuario", nullable=false, insertable=false, updatable=false)
    public TbUsuario getTbUsuario() {
        return this.tbUsuario;
    }
    
    public void setTbUsuario(TbUsuario tbUsuario) {
        this.tbUsuario = tbUsuario;
    }

    
    @Column(name="sts_usuario_cursos", nullable=false)
    public boolean isStsUsuarioCursos() {
        return this.stsUsuarioCursos;
    }
    
    public void setStsUsuarioCursos(boolean stsUsuarioCursos) {
        this.stsUsuarioCursos = stsUsuarioCursos;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="dta_insercao", nullable=false, length=19)
    public Date getDtaInsercao() {
        return this.dtaInsercao;
    }
    
    public void setDtaInsercao(Date dtaInsercao) {
        this.dtaInsercao = dtaInsercao;
    }




}

