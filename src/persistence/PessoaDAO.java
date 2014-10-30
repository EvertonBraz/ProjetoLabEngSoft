package persistence;

import model.Pessoa;

public interface PessoaDAO {
	public Pessoa pesquisarPessoa(String login);
}
