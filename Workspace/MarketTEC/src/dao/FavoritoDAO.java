package dao;

import java.util.List;

import bean.CantidadBean;
import bean.DetFavoritoBean;
import bean.FavoritoBean;

public interface FavoritoDAO {

	
	public abstract int eliminaFavorito(int idFavorito);
	public abstract int insertaFavorito(FavoritoBean obj);
	public abstract List<DetFavoritoBean> consultaFavorito(int idUsuario);
	
	//Contar Favoritos
	public abstract List<CantidadBean> cuentaFavorito(int idUsuario);
	
	
}
