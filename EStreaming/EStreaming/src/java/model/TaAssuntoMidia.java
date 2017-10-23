package model;
// Generated 21/10/2017 10:26:18 by Hibernate Tools 4.3.1


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * TaAssuntoMidia generated by hbm2java
 */
@Entity
@Table(name="ta_assunto_midia"
    ,catalog="estreaming"
)
public class TaAssuntoMidia  implements java.io.Serializable {


     private TaAssuntoMidiaId id;
     private TbAssunto tbAssunto;
     private TbMidia tbMidia;
     private boolean stsAssuntoMidia;

    public TaAssuntoMidia() {
    }

    public TaAssuntoMidia(TaAssuntoMidiaId id, TbAssunto tbAssunto, TbMidia tbMidia, boolean stsAssuntoMidia) {
       this.id = id;
       this.tbAssunto = tbAssunto;
       this.tbMidia = tbMidia;
       this.stsAssuntoMidia = stsAssuntoMidia;
    }
   
     @EmbeddedId

    
    @AttributeOverrides( {
        @AttributeOverride(name="codAssunto", column=@Column(name="cod_assunto", nullable=false) ), 
        @AttributeOverride(name="codMidia", column=@Column(name="cod_midia", nullable=false) ) } )
    public TaAssuntoMidiaId getId() {
        return this.id;
    }
    
    public void setId(TaAssuntoMidiaId id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cod_assunto", nullable=false, insertable=false, updatable=false)
    public TbAssunto getTbAssunto() {
        return this.tbAssunto;
    }
    
    public void setTbAssunto(TbAssunto tbAssunto) {
        this.tbAssunto = tbAssunto;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cod_midia", nullable=false, insertable=false, updatable=false)
    public TbMidia getTbMidia() {
        return this.tbMidia;
    }
    
    public void setTbMidia(TbMidia tbMidia) {
        this.tbMidia = tbMidia;
    }

    
    @Column(name="sts_assunto_midia", nullable=false)
    public boolean isStsAssuntoMidia() {
        return this.stsAssuntoMidia;
    }
    
    public void setStsAssuntoMidia(boolean stsAssuntoMidia) {
        this.stsAssuntoMidia = stsAssuntoMidia;
    }




}


