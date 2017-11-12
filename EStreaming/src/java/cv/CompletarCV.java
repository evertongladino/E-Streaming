/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cv;

import dao.TbCompletarDAO;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import model.TbCompletar;

/**
 *
 * @author hiragi
 */
@FacesConverter(value = "completarCV")
public class CompletarCV implements Converter {

    private TbCompletarDAO dao = new TbCompletarDAO();

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TbCompletar tbCompletar;
        if (value == null) {
            tbCompletar = null;
        } else {
            tbCompletar = dao.consultarPorIdt(Integer.parseInt(value));
        }
        return tbCompletar;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        int id = 0;
        if (value != null) {
            TbCompletar tbCompletar = (TbCompletar) value;
            id = tbCompletar.getIdtCompletar();
        }
        return String.valueOf(id);
    }

}