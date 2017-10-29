/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cv;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

import dao.TbDisciplinaDAO;
import model.TbDisciplina;

/**
 *
 * @author Guilherme
 */
@FacesConverter(value = "disciplinaCV")
public class DisciplinaCV implements Converter {

    private TbDisciplinaDAO dao = new TbDisciplinaDAO();

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TbDisciplina tbDisciplina;
        if (value == null) {
            tbDisciplina = null;
        } else {
            tbDisciplina = dao.consultarPorIdt(Integer.parseInt(value));
        }
        return tbDisciplina;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        int id = 0;
        if (value != null) {
            TbDisciplina tbDisciplina = (TbDisciplina) value;
            id = tbDisciplina.getIdtDisciplina();
        }
        return String.valueOf(id);
    }

}
