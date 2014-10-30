package control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import javax.swing.JOptionPane;
import model.Professor;
import persistence.ProfessorDAO;
import persistence.ProfessorDAOImpl;
import sun.print.PageableDoc;

@WebServlet("/ProfessorController")
public class ProfessorController extends HttpServlet {
	
	private ProfessorDAO professorDAO = new ProfessorDAOImpl();
       
    public ProfessorController() {
        super();
        
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {		
		String funcao = req.getParameter("funcao");
		
		if(funcao.equals("mostrar")){
			String matricula = req.getParameter("professorMatricula");
			ProfessorDAO dao = new ProfessorDAOImpl();
			Professor professor = dao.pesquisarPorMatricula(matricula);
			
			if(professor != null){
				req.setAttribute("PROFESSOR", professor);
				RequestDispatcher rd = req.getRequestDispatcher("./view/formProfessor.jsp");
				rd.include( req, res );
			}
			else{
				req.setAttribute("MSG", "O professor com a matícula " + matricula + " não foi encontrado");
			}
		}
		else if(funcao.equals("excluir")){
			String matricula = req.getParameter("professorMatricula");
			professorDAO.remover(matricula);
			res.sendRedirect("./view/listaProfessores.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String pesquisa = req.getParameter("btnPesquisar");
		String salvar = req.getParameter("btnSalvar");
		
		if(pesquisa != null){
			if(pesquisa.equals("Pesquisar")){
				pesquisa = req.getParameter("txtPesquisar");
				List<Professor> listaProfessores = professorDAO.pesquisarPorNome(pesquisa);
				req.setAttribute("PESQUISA", listaProfessores);
				RequestDispatcher rd = req.getRequestDispatcher("./view/listaProfessores.jsp");
				rd.include( req, res );
			}
		}
		
		if(salvar != null){
			if(salvar.equals("salvar")){
				Professor professor = new Professor();
				professor.setMatricula(req.getParameter("txtMatricula"));
				professor.setNome(req.getParameter("txtNome"));
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date data = null;
				try {
					data = sdf.parse(req.getParameter("txtDataNasc"));
				} catch (ParseException e) {
					e.printStackTrace();
				}
				professor.setDataNascimento(data);
				String sexo = req.getParameter("cbSexo");
				if(sexo.equals("Masculino"))
					professor.setSexo(1);
				else
					professor.setSexo(2);
				professor.setCpf(req.getParameter("txtCpf"));
				professor.setLogradouro(req.getParameter("txtLogradouro"));
				professor.setNumero(req.getParameter("txtNumero"));
				professor.setCep(req.getParameter("txtCep"));
				professor.setBairro(req.getParameter("txtBairro"));
				professor.setCidade(req.getParameter("txtCidade"));
				professor.setEstado(req.getParameter("cbEstado"));
				professor.setTelefone(req.getParameter("txtTelefone"));
				professor.setCelular(req.getParameter("txtCelular"));
				professor.setEmail(req.getParameter("txtEmail"));

				Professor a = professorDAO.pesquisarPorMatricula(professor.getMatricula());
				if(a == null){
					professorDAO.adicionar(professor);
				}else{
					professorDAO.atualizar(a.getMatricula(), professor);
				}
				res.sendRedirect("./view/listaProfessores.jsp");
			}
		}
			
	}

}
