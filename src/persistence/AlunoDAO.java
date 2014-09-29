package persistence;
import java.util.List;

import model.Aluno;


public interface AlunoDAO {
	
	public void adicionar(Aluno aluno);
	public List<Aluno> listar();
	public Aluno pesquisarPorRa(int ra);
	public List<Aluno> pesquisarPorNome(String nome);
	public Aluno pesquisarPorCpf(String cpf);
	public void atualizar(int ra, Aluno aluno);
	public void remover(int ra);

}
