package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import model.Aluno;
import persistence.AlunoDAO;
import persistence.AlunoDAOImpl;

@WebServlet("/AlunoController")
public class AlunoController extends HttpServlet {
       
    public AlunoController() {
        super();
        
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String funcao = req.getParameter("funcao");
		int ra = Integer.parseInt(req.getParameter("alunoRa"));
		if(funcao.equals("mostrar")){
			AlunoDAO dao = new AlunoDAOImpl();
			Aluno aluno = dao.pesquisarPorRa(ra);
			
			if(aluno != null){
				//req.setAttribute("ALUNO", aluno);
				HttpSession ses = req.getSession();
				ses.setAttribute("ALUNO", aluno);
			}
			else{
				req.setAttribute("MSG", "O animal com o id " + ra + " não foi encontrado");
			}
		}
		//RequestDispatcher rd = req.getRequestDispatcher("./formAluno.jsp");
		//rd.include( req, res );
		
		try {
			res.sendRedirect("./view/formAluno.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
