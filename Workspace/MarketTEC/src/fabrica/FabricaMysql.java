package fabrica;

import dao.MySqlUsuarioDAO;
import dao.MySqlUsuarioFbDAO;
import dao.UsuarioDAO;
import dao.UsuarioFbDAO;

//Es una subfabrica que tiene objetos que acceden
//a la base de datos MYSQL
public class FabricaMysql extends Fabrica{

	

	@Override
	public UsuarioDAO getUsuarioDAO() {
		return new MySqlUsuarioDAO();
	}

	@Override
	public UsuarioFbDAO getUsuarioFbDAO() {
		return new MySqlUsuarioFbDAO();
	}

	//Sirve para crear el objeto producto dao
	
}





