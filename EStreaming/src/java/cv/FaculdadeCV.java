/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cv;

import dao.TbFaculdadeDAO;
import model.TbFaculdade;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author hiragi
 */
@FacesConverter(value = "faculdadeCV")
public class FaculdadeCV implements Converter {

    private TbFaculdadeDAO dao = new TbFaculdadeDAO();

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TbFaculdade tbFaculdade;
        if (value == null) {
            tbFaculdade = null;
        } else {
            tbFaculdade = dao.consultarPorIdt(Integer.parseInt(value));
        }
        return tbFaculdade;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        int id = 0;
        if (value != null) {
            TbFaculdade tbFaculdade = (TbFaculdade) value;
            id = tbFaculdade.getIdtFaculdade();
        }
        return String.valueOf(id);
    }

}
