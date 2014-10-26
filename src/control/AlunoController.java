package control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import javax.swing.JOptionPane;

import model.Aluno;
import persistence.AlunoDAO;
import persistence.AlunoDAOImpl;
import sun.print.PageableDoc;

@WebServlet("/AlunoController")
public class AlunoController extends HttpServlet {
	
	private AlunoDAO alunoDAO = new AlunoDAOImpl();
       
    public AlunoController() {
        super();
        
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String funcao = req.getParameter("funcao");
		if(funcao.equals("mostrar")){
			int ra = Integer.parseInt(req.getParameter("alunoRa"));
			AlunoDAO dao = new AlunoDAOImpl();
			Aluno aluno = dao.pesquisarPorRa(ra);
			
			if(aluno != null){
				req.setAttribute("ALUNO", aluno);
				RequestDispatcher rd = req.getRequestDispatcher("./view/formAluno.jsp");
				rd.include( req, res );
			}
			else{
				req.setAttribute("MSG", "O aluno com o id " + ra + " não foi encontrado");
			}
		}
		else if(funcao.equals("excluir")){
			int ra = Integer.parseInt(req.getParameter("alunoRa"));
			alunoDAO.remover(ra);
			res.sendRedirect("./view/listaAlunos.jsp");
		}
		
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String salvar = req.getParameter("btnSalvar");
		String funcao = req.getParameter("funcao");
		if(salvar.equals("salvar")){
			Aluno aluno = new Aluno();
			aluno.setRa(Integer.parseInt(req.getParameter("txtRA")));
			aluno.setNome(req.getParameter("txtNome"));
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Date data = null;
			try {
				data = sdf.parse(req.getParameter("txtDataNasc"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			aluno.setDataNascimento(data);
			String sexo = req.getParameter("cbSexo");
			if(sexo.equals("Masculino"))
				aluno.setSexo(1);
			else
				aluno.setSexo(2);
			aluno.setCpf(req.getParameter("txtCpf"));
			aluno.setLogradouro(req.getParameter("txtLogradouro"));
			aluno.setNumero(req.getParameter("txtNumero"));
			aluno.setCep(req.getParameter("txtCep"));
			aluno.setBairro(req.getParameter("txtBairro"));
			aluno.setCidade(req.getParameter("txtCidade"));
			aluno.setEstado(req.getParameter("cbEstado"));
			aluno.setTelefone(req.getParameter("txtTelefone"));
			aluno.setCelular(req.getParameter("txtCelular"));
			aluno.setEmail(req.getParameter("txtEmail"));
			
			Aluno a = alunoDAO.pesquisarPorRa(aluno.getRa());
			if(a == null){
				alunoDAO.adicionar(aluno);
			}else{
				alunoDAO.atualizar(a.getRa(), aluno);
			}
			res.sendRedirect("./view/listaAlunos.jsp");
		}
			
	}

}
