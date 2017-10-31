/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cv;

import dao.TbAssuntoDAO;
import model.TbAssunto;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author hiragi
 */
@FacesConverter(value = "assuntoCV")
public class AssuntoCV implements Converter {

    private TbAssuntoDAO dao = new TbAssuntoDAO();

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TbAssunto tbAssunto;
        if (value == null) {
            tbAssunto = null;
        } else {
            tbAssunto = dao.consultarPorIdt(Integer.parseInt(value));
        }
        return tbAssunto;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        int id = 0;
        if (value != null) {
            TbAssunto tbAssunto = (TbAssunto) value;
            id = tbAssunto.getIdtAssunto();
        }
        return String.valueOf(id);
    }
}
