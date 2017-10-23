package model;
// Generated 21/10/2017 10:26:18 by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * TbVFAlternativas generated by hbm2java
 */
@Entity
@Table(name="tb_v_f_alternativas"
    ,catalog="estreaming"
)
public class TbVFAlternativas  implements java.io.Serializable {


     private Integer idtVFAlternativas;
     private TbVF tbVF;
     private String txtItem;
     private boolean vlrVF;
     private boolean stsVFAlternativas;

    public TbVFAlternativas() {
    }

    public TbVFAlternativas(TbVF tbVF, String txtItem, boolean vlrVF, boolean stsVFAlternativas) {
       this.tbVF = tbVF;
       this.txtItem = txtItem;
       this.vlrVF = vlrVF;
       this.stsVFAlternativas = stsVFAlternativas;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idt_v_f_alternativas", unique=true, nullable=false)
    public Integer getIdtVFAlternativas() {
        return this.idtVFAlternativas;
    }
    
    public void setIdtVFAlternativas(Integer idtVFAlternativas) {
        this.idtVFAlternativas = idtVFAlternativas;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cod_v_f", nullable=false)
    public TbVF getTbVF() {
        return this.tbVF;
    }
    
    public void setTbVF(TbVF tbVF) {
        this.tbVF = tbVF;
    }

    
    @Column(name="txt_item", nullable=false, length=65535)
    public String getTxtItem() {
        return this.txtItem;
    }
    
    public void setTxtItem(String txtItem) {
        this.txtItem = txtItem;
    }

    
    @Column(name="vlr_v_f", nullable=false)
    public boolean isVlrVF() {
        return this.vlrVF;
    }
    
    public void setVlrVF(boolean vlrVF) {
        this.vlrVF = vlrVF;
    }

    
    @Column(name="sts_v_f_alternativas", nullable=false)
    public boolean isStsVFAlternativas() {
        return this.stsVFAlternativas;
    }
    
    public void setStsVFAlternativas(boolean stsVFAlternativas) {
        this.stsVFAlternativas = stsVFAlternativas;
    }




}


