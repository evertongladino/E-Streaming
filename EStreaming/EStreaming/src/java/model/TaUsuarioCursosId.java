package model;
// Generated 21/10/2017 10:26:18 by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * TaUsuarioCursosId generated by hbm2java
 */
@Embeddable
public class TaUsuarioCursosId  implements java.io.Serializable {


     private int codCurso;
     private int codUsuario;

    public TaUsuarioCursosId() {
    }

    public TaUsuarioCursosId(int codCurso, int codUsuario) {
       this.codCurso = codCurso;
       this.codUsuario = codUsuario;
    }
   


    @Column(name="cod_curso", nullable=false)
    public int getCodCurso() {
        return this.codCurso;
    }
    
    public void setCodCurso(int codCurso) {
        this.codCurso = codCurso;
    }


    @Column(name="cod_usuario", nullable=false)
    public int getCodUsuario() {
        return this.codUsuario;
    }
    
    public void setCodUsuario(int codUsuario) {
        this.codUsuario = codUsuario;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof TaUsuarioCursosId) ) return false;
		 TaUsuarioCursosId castOther = ( TaUsuarioCursosId ) other; 
         
		 return (this.getCodCurso()==castOther.getCodCurso())
 && (this.getCodUsuario()==castOther.getCodUsuario());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getCodCurso();
         result = 37 * result + this.getCodUsuario();
         return result;
   }   


}


