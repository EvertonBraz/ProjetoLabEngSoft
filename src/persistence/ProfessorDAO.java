package persistence;
import java.util.List;

import model.Professor;


public interface ProfessorDAO {
	
	public void adicionar(Professor professor);
	public List<Professor> listar();
	public Professor pesquisarPorMatricula(String matricula);
	public List<Professor> pesquisarPorNome(String nome);
	public Professor pesquisarPorCpf(String cpf);
	public void atualizar(String matricula, Professor professor);
	public void remover(String matricula);

}
