package validations;

public class LerCampos {
	
	public static String lerSexo(int s){
		String sexo = "";
		if(s == 1)
			sexo = "Masculino";
		else if(s == 2)
			sexo = "Feminino";
		return sexo;
	}
	
	public static String sexoSelecionado(String opcao, String sexo){
		return opcao.equals(sexo) ? "selected" : ""; 
	}
	
	public static String estadoSelecionado(String opcao, String estado){
		return opcao.equals(estado) ? "selected" : ""; 
	}

}
