package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bean.UsuarioFbBean;
import util.ConectaDB;

public class MySqlUsuarioFbDAO implements UsuarioFbDAO {

	private static final Log log = LogFactory.getLog(MySqlUsuarioFbDAO.class);
	

	@Override
	public int insertaUsuario(UsuarioFbBean obj) throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "insert into usuariofb values(null,?,?)";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombres());
			pstm.setString(2, obj.getCorreo());
			
			
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
	public List<UsuarioFbBean> consultaUsuarioFb(String filtro) throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<UsuarioFbBean> lista = new ArrayList<UsuarioFbBean>();
		try {
			String sql = "select * from usuariofb where nombres like ?";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro + "%");
			log.info(pstm);
			rs = pstm.executeQuery();
			UsuarioFbBean bean = null;
			while(rs.next()){
				bean = new UsuarioFbBean();
				bean.setIdUsuario(rs.getInt(1));
				bean.setNombres(rs.getString(2));
				bean.setCorreo(rs.getString(3));
				
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
	public List<UsuarioFbBean> login(UsuarioFbBean obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<UsuarioFbBean> lista = new ArrayList<UsuarioFbBean>();
		
		try {
			String sql = "select * from usuariofb where correo =?";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getCorreo());
			
			log.info(pstm);
			rs = pstm.executeQuery();
			UsuarioFbBean bean = null;
			while(rs.next()){
				bean = new UsuarioFbBean();
				bean.setIdUsuario(rs.getInt(1));
				bean.setNombres(rs.getString(2));
				bean.setCorreo(rs.getString(3));
				
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
