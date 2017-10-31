/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cv;

import dao.TbSomatorioDAO;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import model.TbSomatorio;

/**
 *
 * @author hiragi
 */
@FacesConverter(value = "somatorioCV")
public class SomatorioCV implements Converter {

    private TbSomatorioDAO dao = new TbSomatorioDAO();

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TbSomatorio tbSomatorio;
        if (value == null) {
            tbSomatorio = null;
        } else {
            tbSomatorio = dao.consultarPorIdt(Integer.parseInt(value));
        }
        return tbSomatorio;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        int id = 0;
        if (value != null) {
            TbSomatorio tbSomatorio = (TbSomatorio) value;
            id = tbSomatorio.getIdtSomatorio();
        }
        return String.valueOf(id);
    }

}
