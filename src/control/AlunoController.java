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
				req.setAttribute("ALUNO", aluno);
			}
			else{
				req.setAttribute("MSG", "O aluno com o id " + ra + " não foi encontrado");
			}
		}
		RequestDispatcher rd = req.getRequestDispatcher("./view/formAluno.jsp");
		rd.include( req, res );
		
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String funcao = req.getParameter("btnSalvar");
		if(funcao.equals("salvar")){
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
			
			String msg = aluno.getRa() + "\n" +
			aluno.getNome() + "\n" +
			aluno.getDataNascimento() + "\n" +
			aluno.getSexo() + "\n" +
			aluno.getCpf() + "\n" +
			aluno.getLogradouro() + "\n" +
			aluno.getCep() + "\n" +
			aluno.getNumero() + "\n" +
			aluno.getBairro() + "\n" +
			aluno.getCidade() + "\n" +
			aluno.getEstado() + "\n" +
			aluno.getTelefone() + "\n" +
			aluno.getCelular() + "\n" +
			aluno.getEmail() + "\n";
			JOptionPane.showMessageDialog(null, msg);
			
			AlunoDAO alunoDAO = new AlunoDAOImpl();
			alunoDAO.adicionar(aluno);
		}
	}

}
