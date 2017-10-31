/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cv;

import dao.TbTipoMidiaDAO;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import model.TbTipoMidia;

/**
 *
 * @author hiragi
 */
@FacesConverter(value = "tipoMidiaCV")
public class TipoMidiaCV implements Converter {

    private TbTipoMidiaDAO dao = new TbTipoMidiaDAO();

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TbTipoMidia tbTipoMidia;
        if (value == null) {
            tbTipoMidia = null;
        } else {
            tbTipoMidia = dao.consultarPorIdt(Integer.parseInt(value));
        }
        return tbTipoMidia;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        int id = 0;
        if (value != null) {
            TbTipoMidia tbTipoQuestao = (TbTipoMidia) value;
            id = tbTipoQuestao.getIdtTipoMidia();
        }
        return String.valueOf(id);
    }

}