package fabrica;

import dao.FavoritoDAO;
import dao.PedidoDAO;
import dao.ProductoDAO;
import dao.UsuarioDAO;
import dao.UsuarioFbDAO;

//Es una f�brica de objetos
//Se usa el patr�n DAO (Data Access Object)
public abstract class Fabrica {

	public static final int MYSQL = 1;
	public static final int SQLSERVER = 2;

	//Se inscribe el dao alumno a las f�bricas
	public abstract UsuarioDAO getUsuarioDAO();
	public abstract ProductoDAO getProductoDAO();
	public abstract FavoritoDAO getFavoritoDAO();
	public abstract PedidoDAO getPedidoDAO();
	public abstract UsuarioFbDAO getUsuarioFbDAO(); 
	
	//Va fabricar subfabricas (Mysql y sqlserver)
	public static Fabrica getFabrica(int tipo){
		Fabrica salida = null;
		switch(tipo){
			case MYSQL: 
				salida = new FabricaMysql();
				break;
		}
		return salida;
	}
}
