package dao;

import java.util.List;

import bean.UsuarioBean;

public interface UsuarioDAO {

	
	public abstract int eliminaUsuario(int idUsuario) throws Exception;
	public abstract int insertaUsuario(UsuarioBean obj) throws Exception;
	public abstract int actualizaUsuario(UsuarioBean obj) throws Exception;
	public abstract List<UsuarioBean> consultaUsuario(String filtro) throws Exception;
	public abstract List<UsuarioBean> login(UsuarioBean obj);
	
	public abstract List<UsuarioBean> loginAdmin(UsuarioBean obj);
	
	
}
