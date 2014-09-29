package persistence;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import model.Aluno;
import model.Pessoa;

public class AutenticavelDAOImpl implements Autenticavel {

	Conexao con = new Conexao();
	
	@Override
	public Pessoa autenticar(String login) {
		String sql = "select * from tblUsuarios where login like ?";
		Pessoa pessoa = new Pessoa();
		try {
			PreparedStatement ps = con.getConnection().prepareStatement(sql);
			ps.setString(1, login);
			ResultSet rs = ps.executeQuery();
			if(rs.first()){
				pessoa.setLogin(rs.getString("login"));
				pessoa.setSenha(rs.getString("senha"));
			}
			else{
				pessoa = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			pessoa = null;
		}
		return pessoa;
	}

}
