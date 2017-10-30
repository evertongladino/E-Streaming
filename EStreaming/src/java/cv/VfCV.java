/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cv;

import dao.TbVfDAO;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import model.TbVF;

/**
 *
 * @author hiragi
 */
@FacesConverter(value = "VfCV")
public class VfCV implements Converter {

    private TbVfDAO dao = new TbVfDAO();

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TbVF tbVF;
        if (value == null) {
            tbVF = null;
        } else {
            tbVF = (TbVF) dao.consultarPorIdtVF(Integer.parseInt(value)); //consultarPorIdt(Integer.parseInt(value));
        }
        return tbVF;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        int id = 0;
        if (value != null) {
            TbVF tbVF = (TbVF) value;
            id = tbVF.getIdtVf();
        }
        return String.valueOf(id);
    }

}