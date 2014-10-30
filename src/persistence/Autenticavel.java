package persistence;

import model.Pessoa;

public interface Autenticavel {
	public Pessoa autenticar(String login);
}
