package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import persistence.Autenticavel;
import persistence.AutenticavelDAOImpl;
import model.Pessoa;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    public LoginController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("Servlet acionado...");
		
		String login = req.getParameter("txtLogin");
		String senha = req.getParameter("txtSenha");
	    
	    Autenticavel autenticavel = new AutenticavelDAOImpl();
	    Pessoa pessoa = autenticavel.autenticar(login);
	    
	    HttpSession ses = req.getSession();
	    
	    if(pessoa != null){
	    	if(pessoa.getSenha().equals(senha)){
	    		ses.setAttribute("PESSOA", pessoa.getLogin());
	    	}
	    } else {
	    	ses.setAttribute("PESSOA", "Nenhum usuário encontrado");
	    }
	    
	    try {
			res.sendRedirect("./view/menu.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

}
