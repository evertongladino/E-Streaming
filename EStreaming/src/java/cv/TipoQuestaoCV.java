/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cv;

import dao.TbTipoQuestaoDAO;
<<<<<<< HEAD
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import model.TbTipoQuestao;

/**
 *
 * @author hiragi
 */
@FacesConverter(value = "tipoQuestaoCV")
public class TipoQuestaoCV implements Converter {

    private TbTipoQuestaoDAO dao = new TbTipoQuestaoDAO();

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TbTipoQuestao tbTipoQuestao;
        if (value == null) {
            tbTipoQuestao = null;
        } else {
            tbTipoQuestao = dao.consultarPorIdt(Integer.parseInt(value));
        }
        return tbTipoQuestao;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        int id = 0;
        if (value != null) {
            TbTipoQuestao tbTipoQuestao = (TbTipoQuestao) value;
            id = tbTipoQuestao.getIdtTipoQuestao();
        }
        return String.valueOf(id);
    }

}
=======
import model.TbTipoQuestao;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author hiragi
 */
@FacesConverter(value = "tipoQuestaoCV")
public class TipoQuestaoCV implements Converter {

    private TbTipoQuestaoDAO dao = new TbTipoQuestaoDAO();

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TbTipoQuestao tbTipoQuestao;
        if (value == null) {
            tbTipoQuestao = null;
        } else {
            tbTipoQuestao = dao.consultarPorIdt(Integer.parseInt(value));
        }
        return tbTipoQuestao;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        int id = 0;
        if (value != null) {
            TbTipoQuestao tbTipoQuestao = (TbTipoQuestao) value;
            id = tbTipoQuestao.getIdtTipoQuestao();
        }
        return String.valueOf(id);
    }

}
>>>>>>> refs/remotes/origin/Cruds_Caio_v2
