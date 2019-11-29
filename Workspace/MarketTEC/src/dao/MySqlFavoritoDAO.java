package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bean.CantidadBean;
import bean.DetFavoritoBean;
import bean.FavoritoBean;
import util.ConectaDB;

public class MySqlFavoritoDAO implements FavoritoDAO {

	private static final Log log = LogFactory.getLog(MySqlFavoritoDAO.class);
	

	@Override
	public int eliminaFavorito(int idFavorito)  {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "delete from favorito where idfavorito =?";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idFavorito);

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
	public int insertaFavorito(FavoritoBean obj)  {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "insert into favorito values(null,?,?)";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, obj.getIdUsuario());
			pstm.setInt(2, obj.getIdProducto());
			
			
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
	public List<DetFavoritoBean> consultaFavorito(int idUsuario)  {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<DetFavoritoBean> lista = new ArrayList<DetFavoritoBean>();
		try {
			String sql = "SELECT f.* ,p.imagen, p.nombre, p.categoria, p.precio FROM favorito f inner join usuario u inner join producto p where f.idusuario = u.idusuario and f.idproducto = p.idproducto and f.idusuario = ? order by f.idfavorito desc;";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idUsuario);
			log.info(pstm);
			rs = pstm.executeQuery();
			DetFavoritoBean bean = null;
			while(rs.next()){
				bean = new DetFavoritoBean();
				bean.setIdFavorito(rs.getInt(1));
				bean.setIdUsuario(rs.getInt(2));
				bean.setIdProducto(rs.getInt(3));
				bean.setImagen(rs.getString(4));
				bean.setNombre(rs.getString(5));
				bean.setCategoria(rs.getString(6));
				bean.setPrecio(rs.getDouble(7));
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
	public List<CantidadBean> cuentaFavorito(int idUsuario)  {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<CantidadBean> lista = new ArrayList<CantidadBean>();
		try {
			String sql = "select count(*) as cantidad from favorito where idusuario = ?";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1,idUsuario);
			log.info(pstm);
			rs = pstm.executeQuery();
			
			CantidadBean bean = null;
			while(rs.next()){
				bean = new CantidadBean();
				bean.setCantidad(rs.getInt(1));
				
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
