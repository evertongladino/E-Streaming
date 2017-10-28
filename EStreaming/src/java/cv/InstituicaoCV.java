/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cv;

import dao.TbInstituicaoDAO;
import model.TbInstituicao;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author hiragi
 */
@FacesConverter(value = "instituicaoCV")
public class InstituicaoCV implements Converter {

    private TbInstituicaoDAO dao = new TbInstituicaoDAO();

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TbInstituicao tbInstituicao;
        if (value == null) {
            tbInstituicao = null;
        } else {
            tbInstituicao = dao.consultarPorIdt(Integer.parseInt(value));
        }
        return tbInstituicao;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        int id = 0;
        if (value != null) {
            TbInstituicao tbInstituicao = (TbInstituicao) value;
            id = tbInstituicao.getIdtInstituicao();
        }
        return String.valueOf(id);
    }

}
