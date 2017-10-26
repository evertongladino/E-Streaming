package filter;

import javax.faces.application.NavigationHandler;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
import javax.servlet.http.HttpSession;

/**
 * Responsável por manipular requisições de usuário, permitindo acesso ao
 * conteúdo da aplicação somente no caso do usuário já ter se autenticado.
 */
public class FiltrarPaginas implements PhaseListener {

    @Override
    public void afterPhase(PhaseEvent event) {
        FacesContext contexto = event.getFacesContext();
        String pagina = contexto.getViewRoot().getViewId();

        System.out.println(">>> Página: " + pagina);

        if (pagina.substring(1).contains("/")) {  // Verificar se esta dentro de uma pasta
            HttpSession sessao = (HttpSession) contexto.getExternalContext().getSession(false);
            if (sessao==null){  // Sessão expirou
                NavigationHandler navHandler = contexto.getApplication().getNavigationHandler();
                navHandler.handleNavigation(contexto, null, "/logado");
                return;
            }
            
            String perfil = (sessao.getAttribute("SESSAO_PERFIL") == null ? "INVALIDO" : (String) sessao.getAttribute("SESSAO_PERFIL"));
            if (!pagina.contains(perfil)) {
//                NavigationHandler navHandler = contexto.getApplication().getNavigationHandler();
//                navHandler.handleNavigation(contexto, null, "/nok");
            }
        }

    }

    @Override
    public void beforePhase(PhaseEvent event) {

    }

    @Override
    public PhaseId getPhaseId() {
        return PhaseId.RESTORE_VIEW;
    }
}
