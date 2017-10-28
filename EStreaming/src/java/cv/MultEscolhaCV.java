/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cv;

import dao.TbMultEscolhaDAO;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import model.TbMultEscolha;

/**
 *
 * @author hiragi
 */
@FacesConverter(value = "multEscolhaCV")
public class MultEscolhaCV implements Converter {

    private TbMultEscolhaDAO dao = new TbMultEscolhaDAO();

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TbMultEscolha tbMultEscolha;
        if (value == null) {
            tbMultEscolha = null;
        } else {
            tbMultEscolha = dao.consultarPorIdt(Integer.parseInt(value));
        }
        return tbMultEscolha;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        int id = 0;
        if (value != null) {
            TbMultEscolha tbMultEscolha = (TbMultEscolha) value;
            id = tbMultEscolha.getIdtMultEscolha();
        }
        return String.valueOf(id);
    }

}
