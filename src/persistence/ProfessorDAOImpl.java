package persistence;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import model.Professor;

public class ProfessorDAOImpl implements ProfessorDAO {
	
	Conexao con = new Conexao();

	@Override
	public void adicionar(Professor professor) {
		String sql = "insert into tblProfessores values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.getConnection().prepareStatement(sql);
			ps.setString(1, professor.getMatricula());
			ps.setString(2, professor.getNome());			
			ps.setDate(3, new java.sql.Date(professor.getDataNascimento().getTime()));
			ps.setInt(4, professor.getSexo());
			ps.setString(5, professor.getCpf());
			ps.setString(6, professor.getLogradouro());
			ps.setString(7, professor.getNumero());
			ps.setString(8, professor.getCep());
			ps.setString(9, professor.getBairro());
			ps.setString(10, professor.getCidade());
			ps.setString(11, professor.getEstado());
			ps.setString(12, professor.getTelefone());
			ps.setString(13, professor.getCelular());
			ps.setString(14, professor.getEmail());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<Professor> listar(){
		List<Professor> listaProfessores = new ArrayList<Professor>();
		String sql = "select * from tblProfessores";
		try {
			PreparedStatement ps = con.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Professor professor = new Professor();
				professor.setMatricula(rs.getString("matricula"));
				professor.setNome(rs.getString("nome"));
				professor.setDataNascimento(rs.getDate("dataNascimento"));
				professor.setSexo(rs.getInt("sexo"));
				professor.setCpf(rs.getString("cpf"));
				professor.setLogradouro(rs.getString("logradouro"));
				professor.setNumero(rs.getString("numero"));
				professor.setCep(rs.getString("cep"));
				professor.setBairro(rs.getString("bairro"));
				professor.setCidade(rs.getString("cidade"));
				professor.setEstado(rs.getString("estado"));
				professor.setTelefone(rs.getString("telefone"));
				professor.setCelular(rs.getString("celular"));
				professor.setEmail(rs.getString("email"));
				listaProfessores.add(professor);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listaProfessores;
	}

	@Override
	public Professor pesquisarPorMatricula(String matricula) {
		String sql = "select * from tblProfessores where matricula = ?";
		Professor professor = new Professor();
		try {
			PreparedStatement ps = con.getConnection().prepareStatement(sql);
			ps.setString(1, matricula);
			ResultSet rs = ps.executeQuery();
			rs.first();
			professor.setMatricula(rs.getString("matricula"));
			professor.setNome(rs.getString("nome"));
			professor.setDataNascimento(rs.getDate("dataNascimento"));
			professor.setSexo(rs.getInt("sexo"));
			professor.setCpf(rs.getString("cpf"));
			professor.setLogradouro(rs.getString("logradouro"));
			professor.setNumero(rs.getString("numero"));
			professor.setCep(rs.getString("cep"));
			professor.setBairro(rs.getString("bairro"));
			professor.setCidade(rs.getString("cidade"));
			professor.setEstado(rs.getString("estado"));
			professor.setTelefone(rs.getString("telefone"));
			professor.setCelular(rs.getString("celular"));
			professor.setEmail(rs.getString("email"));
			
		} catch (SQLException e) {
			e.printStackTrace();
			professor = null;
		}
		return professor;
	}

	@Override
	public List<Professor> pesquisarPorNome(String nome) {
		String sql = "select * from tblProfessores where nome like ?";
		List<Professor> listaProfessores = new ArrayList<Professor>();
		try {
			PreparedStatement ps = con.getConnection().prepareStatement(sql);
			ps.setString(1, "%" + nome + "%");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Professor professor = new Professor();
				professor.setMatricula(rs.getString("matricula"));
				professor.setNome(rs.getString("nome"));
				professor.setDataNascimento(rs.getDate("dataNascimento"));
				professor.setSexo(rs.getInt("sexo"));
				professor.setCpf(rs.getString("cpf"));
				professor.setLogradouro(rs.getString("logradouro"));
				professor.setNumero(rs.getString("numero"));
				professor.setCep(rs.getString("cep"));
				professor.setBairro(rs.getString("bairro"));
				professor.setCidade(rs.getString("cidade"));
				professor.setEstado(rs.getString("estado"));
				professor.setTelefone(rs.getString("telefone"));
				professor.setCelular(rs.getString("celular"));
				professor.setEmail(rs.getString("email"));
				listaProfessores.add(professor);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listaProfessores;
	}
		
	@Override
	public Professor pesquisarPorCpf(String cpf) {
		String sql = "select * from tblProfessores where cpf like ?";
		Professor professor = new Professor();
		try {
			PreparedStatement ps = con.getConnection().prepareStatement(sql);
			ps.setString(1, "%" + cpf + "%");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				professor.setMatricula(rs.getString("matricula"));
				professor.setNome(rs.getString("nome"));
				professor.setDataNascimento(rs.getDate("dataNascimento"));
				professor.setSexo(rs.getInt("sexo"));
				professor.setCpf(rs.getString("cpf"));
				professor.setLogradouro(rs.getString("logradouro"));
				professor.setNumero(rs.getString("numero"));
				professor.setCep(rs.getString("cep"));
				professor.setBairro(rs.getString("bairro"));
				professor.setCidade(rs.getString("cidade"));
				professor.setEstado(rs.getString("estado"));
				professor.setTelefone(rs.getString("telefone"));
				professor.setCelular(rs.getString("celular"));
				professor.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return professor;
	}	

	@Override
	public void atualizar(String matricula, Professor professor) {
		String sql = "update tblProfessores set  matricula = ?, nome = ?, dataNascimento = ?, sexo = ?, cpf = ?, logradouro = ?, numero = ?, cep = ?, bairro = ?, cidade = ?, estado = ?, telefone = ?, celular = ?, email = ? where matricula = ?";
		try {
			PreparedStatement ps = con.getConnection().prepareStatement(sql);
			ps.setString(1, professor.getMatricula());
			ps.setString(2, professor.getNome());			
			ps.setDate(3, new java.sql.Date(professor.getDataNascimento().getTime()));
			ps.setInt(4, professor.getSexo());
			ps.setString(5, professor.getCpf());
			ps.setString(6, professor.getLogradouro());
			ps.setString(7, professor.getNumero());
			ps.setString(8, professor.getCep());
			ps.setString(9, professor.getBairro());
			ps.setString(10, professor.getCidade());
			ps.setString(11, professor.getEstado());
			ps.setString(12, professor.getTelefone());
			ps.setString(13, professor.getCelular());
			ps.setString(14, professor.getEmail());
			ps.setString(15, matricula);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

	}

	@Override
	public void remover(String matricula) {
		String sql = "delete from tblProfessores where matricula = ?";
		try {
			PreparedStatement ps = con.getConnection().prepareStatement(sql);
			ps.setString(1, matricula);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
