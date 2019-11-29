package dao;

import java.util.List;

import bean.UsuarioBean;

public interface UsuarioDAO {

	
	public abstract int eliminaUsuario(int idUsuario);
	public abstract int insertaUsuario(UsuarioBean obj);
	public abstract int actualizaUsuario(UsuarioBean obj);
	public abstract List<UsuarioBean> consultaUsuario(String filtro);
	public abstract List<UsuarioBean> login(UsuarioBean obj);
	
	public abstract List<UsuarioBean> loginAdmin(UsuarioBean obj);
	
	//Para REST
	
	
	
}
