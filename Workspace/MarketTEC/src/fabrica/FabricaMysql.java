package fabrica;

import dao.FavoritoDAO;
import dao.MySqlFavoritoDAO;
import dao.MySqlPedidoDAO;
import dao.MySqlProductoDAO;
import dao.MySqlUsuarioDAO;
import dao.MySqlUsuarioFbDAO;
import dao.PedidoDAO;
import dao.ProductoDAO;
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

	@Override
	public ProductoDAO getProductoDAO() {
		return new MySqlProductoDAO();
	}

	@Override
	public FavoritoDAO getFavoritoDAO() {
		return new MySqlFavoritoDAO();
	}

	@Override
	public PedidoDAO getPedidoDAO() {
		return new MySqlPedidoDAO();
	}

	
	
}





