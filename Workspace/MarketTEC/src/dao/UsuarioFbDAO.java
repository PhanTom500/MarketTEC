package dao;

import java.util.List;

import bean.UsuarioFbBean;

public interface UsuarioFbDAO {

	
	public abstract int insertaUsuario(UsuarioFbBean obj) throws Exception;
	public abstract List<UsuarioFbBean> consultaUsuarioFb(String filtro) throws Exception;
	public abstract List<UsuarioFbBean> login(UsuarioFbBean obj);
	
	
}
