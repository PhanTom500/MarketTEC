package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bean.UsuarioBean;
import util.ConectaDB;

public class MySqlUsuarioDAO implements UsuarioDAO {

	private static final Log log = LogFactory.getLog(MySqlUsuarioDAO.class);
	

	@Override
	public int eliminaUsuario(int idUsuario) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "delete from usuario where idusuario =?";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idUsuario);

			log.info(pstm);
			
			salida = pstm.executeUpdate();
			
		} catch (Exception e) {
			log.info(e);
		} finally {
			try {
				if (pstm != null)pstm.close();
			} catch (SQLException e1) {}
			try {
				if (conn != null)conn.close();
			} catch (SQLException e) {}
		}
		return salida;
	}

	@Override
	public int insertaUsuario(UsuarioBean obj)  {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "insert into usuario values(null,?,?,?,?)";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombres());
			pstm.setString(2, obj.getCorreo());
			pstm.setString(3, obj.getPass());
			pstm.setInt(4, obj.getTipo());
			
			
			log.info(pstm);
			
			salida = pstm.executeUpdate();
			
		} catch (Exception e) {
			log.info(e);
		} finally {
			try {
				if (pstm != null)pstm.close();
			} catch (SQLException e1) {}
			try {
				if (conn != null)conn.close();
			} catch (SQLException e) {}
		}
		return salida;
	}

	@Override
	public int actualizaUsuario(UsuarioBean obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "update usuario set nombres =?, correo =?, pass =?, tipo =? where idusuario =? ";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombres());
			pstm.setString(2, obj.getCorreo());
			pstm.setString(3, obj.getPass());
			pstm.setInt(4, obj.getTipo());
			pstm.setInt(5, obj.getIdUsuario());
			log.info(pstm);
			
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			log.info(e);
		} finally {
			try {
				if (pstm != null)pstm.close();
			} catch (SQLException e1) {}
			try {
				if (conn != null)conn.close();
			} catch (SQLException e) {}
		}
		return salida;
	}

	@Override
	public List<UsuarioBean> consultaUsuario(String filtro)  {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<UsuarioBean> lista = new ArrayList<UsuarioBean>();
		try {
			String sql = "select * from usuario where nombres like ?";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro + "%");
			log.info(pstm);
			rs = pstm.executeQuery();
			UsuarioBean bean = null;
			while(rs.next()){
				bean = new UsuarioBean();
				bean.setIdUsuario(rs.getInt(1));
				bean.setNombres(rs.getString(2));
				bean.setCorreo(rs.getString(3));
				bean.setPass(rs.getString(4));
				bean.setTipo(rs.getInt(5));
				lista.add(bean);
			}
		} catch (Exception e) {
			log.info(e);
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstm != null)pstm.close();
				if (conn != null)conn.close();
			} catch (SQLException e) {}
		}
		return lista;
	}
	
	@Override
	public List<UsuarioBean> login(UsuarioBean obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<UsuarioBean> lista = new ArrayList<UsuarioBean>();
		
		try {
			String sql = "select * from usuario where correo =? and pass=?";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getCorreo());
			pstm.setString(2, obj.getPass());
			log.info(pstm);
			rs = pstm.executeQuery();
			UsuarioBean bean = null;
			while(rs.next()){
				bean = new UsuarioBean();
				bean.setIdUsuario(rs.getInt(1));
				bean.setNombres(rs.getString(2));
				bean.setCorreo(rs.getString(3));
				bean.setPass(rs.getString(4));
				bean.setTipo(rs.getInt(5));
				lista.add(bean);
			}
		} catch (Exception e) {
			log.info(e);
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstm != null)pstm.close();
				if (conn != null)conn.close();
			} catch (SQLException e) {}
		}
		return lista;
		
	}

	@Override
	public List<UsuarioBean> loginAdmin(UsuarioBean obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<UsuarioBean> lista = new ArrayList<UsuarioBean>();
		
		try {
			String sql = "select * from usuario where tipo = 1 and correo =? and pass=?";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getCorreo());
			pstm.setString(2, obj.getPass());
			log.info(pstm);
			rs = pstm.executeQuery();
			UsuarioBean bean = null;
			while(rs.next()){
				bean = new UsuarioBean();
				bean.setIdUsuario(rs.getInt(1));
				bean.setNombres(rs.getString(2));
				bean.setCorreo(rs.getString(3));
				bean.setPass(rs.getString(4));
				bean.setTipo(rs.getInt(5));
				lista.add(bean);
			}
		} catch (Exception e) {
			log.info(e);
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstm != null)pstm.close();
				if (conn != null)conn.close();
			} catch (SQLException e) {}
		}
		return lista;
	}

}
