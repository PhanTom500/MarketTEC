package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bean.DetPedidoBean;
import bean.PedidoBean;
import bean.TbDetPedidoBean;
import bean.TbPedidoBean;
import util.ConectaDB;

public class MySqlPedidoDAO implements PedidoDAO {

	private static final Log log = LogFactory.getLog(MySqlPedidoDAO.class);
	

	@Override
	public int insertaPedido(PedidoBean obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "insert into pedido values(null,?,?,?)";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, obj.getIdUsuario());
			pstm.setString(2, obj.getFechaRegistro());
			pstm.setString(3, obj.getEstado());
			
			
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
	public int actualizaPedido(PedidoBean obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "update pedido set estado =? where idpedido =? ";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getEstado());
			pstm.setInt(2, obj.getIdPedido());
			
			
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
	public int eliminaPedido(int idPedido) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "delete from pedido where idpedido =?";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idPedido);

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
	public List<TbPedidoBean> consultaPedido(String nombre, String estado) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<TbPedidoBean> lista = new ArrayList<TbPedidoBean>();
		try {
			String sql = "SELECT p.idpedido, u.nombres, p.fecRegistro, p.estado FROM pedido p inner join usuario u where p.idusuario = u.idusuario and u.nombres like ? and p.estado like ? order by p.idpedido desc;";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, "%" + nombre + "%");
			pstm.setString(2, "%" + estado + "%");
			log.info(pstm);
			rs = pstm.executeQuery();
			TbPedidoBean bean = null;
			while(rs.next()){
				bean = new TbPedidoBean();
				bean.setIdPedido(rs.getInt(1));
				bean.setNombres(rs.getString(2));
				bean.setFechaRegistro(rs.getString(3));
				bean.setEstado(rs.getString(4));
				
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
	public int insertaDetPedido(DetPedidoBean obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "insert into detalle_pedido values(null,?,?,?,?)";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, obj.getIdPedido());
			pstm.setInt(2, obj.getIdProducto());
			pstm.setInt(3, obj.getCantidad());
			pstm.setDouble(4, obj.getPrecio());
			
			
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
	public List<PedidoBean> consultaPedidoxUsuario(int idUsuario) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<PedidoBean> lista = new ArrayList<PedidoBean>();
		try {
			String sql = "SELECT * FROM pedido where idusuario = ? order by idpedido desc;";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idUsuario);
			log.info(pstm);
			rs = pstm.executeQuery();
			PedidoBean bean = null;
			while(rs.next()){
				bean = new PedidoBean();
				bean.setIdPedido(rs.getInt(1));
				bean.setIdUsuario(rs.getInt(2));
				bean.setFechaRegistro(rs.getString(3));
				bean.setEstado(rs.getString(4));
				
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
	public List<TbDetPedidoBean> consultaDetPedido(int idPedido) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<TbDetPedidoBean> lista = new ArrayList<TbDetPedidoBean>();
		try {
			String sql = "SELECT dp.iddetalle_pedido, p.imagen, p.nombre, dp.cantidad, dp.precio FROM detalle_pedido dp inner join producto p where dp.idproducto = p.idproducto and dp.idpedido = ?;";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idPedido);
			log.info(pstm);
			rs = pstm.executeQuery();
			TbDetPedidoBean bean = null;
			while(rs.next()){
				bean = new TbDetPedidoBean();
				bean.setIdDetPedido(rs.getInt(1));
				bean.setImagen(rs.getString(2));
				bean.setNombre(rs.getString(3));
				bean.setCantidad(rs.getInt(4));
				bean.setPrecio(rs.getDouble(5));
				
				
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
	public List<PedidoBean> consultaUltimoPedidoxUsuario(int idUsuario) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<PedidoBean> lista = new ArrayList<PedidoBean>();
		try {
			String sql = "SELECT * FROM pedido where idusuario = ? order by idpedido desc limit 1;";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idUsuario);
			log.info(pstm);
			rs = pstm.executeQuery();
			PedidoBean bean = null;
			while(rs.next()){
				bean = new PedidoBean();
				bean.setIdPedido(rs.getInt(1));
				bean.setIdUsuario(rs.getInt(2));
				bean.setFechaRegistro(rs.getString(3));
				bean.setEstado(rs.getString(4));
				
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
	public List<DetPedidoBean> consultaDetPedidoxID(int idPedido) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<DetPedidoBean> lista = new ArrayList<DetPedidoBean>();
		try {
			String sql = "SELECT * FROM detalle_pedido where idpedido = ?;";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idPedido);
			log.info(pstm);
			rs = pstm.executeQuery();
			DetPedidoBean bean = null;
			while(rs.next()){
				bean = new DetPedidoBean();
				bean.setIdDetPedido(rs.getInt(1));
				bean.setIdPedido(rs.getInt(2));
				bean.setIdProducto(rs.getInt(3));
				bean.setCantidad(rs.getInt(4));
				bean.setPrecio(rs.getDouble(5));
				
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
