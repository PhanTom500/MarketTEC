package dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bean.CantidadBean;
import bean.ProductoBean;
import util.ConectaDB;

public class MySqlProductoDAO implements ProductoDAO {

	private static final Log log = LogFactory.getLog(MySqlProductoDAO.class);
	

	@Override
	public int eliminaProducto(int idProducto) throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "delete from producto where idproducto =?";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idProducto);

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
	public int insertaProducto(ProductoBean obj) throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "insert into producto values(null,?,?,?,?,?,?,?)";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getDescripcion());
			pstm.setDouble(3, obj.getPrecio());
			pstm.setInt(4, obj.getStock());
			pstm.setString(5, obj.getImagen());
			pstm.setString(6, obj.getCategoria());
			pstm.setString(7, obj.getFecRegistro());
			
			
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
	public int actualizaProducto(ProductoBean obj) throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			String sql = "update producto set nombre =?, descripcion =?, precio =?, stock =?, imagen =?, categoria =?, fecRegistro =? where idproducto =? ";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getDescripcion());
			pstm.setDouble(3, obj.getPrecio());
			pstm.setInt(4, obj.getStock());
			pstm.setString(5, obj.getImagen());
			pstm.setString(6, obj.getCategoria());
			pstm.setString(7, obj.getFecRegistro());
			pstm.setInt(8, obj.getIdProducto());
			
			
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
	public List<ProductoBean> consultaProducto(String filtro) throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<ProductoBean> lista = new ArrayList<ProductoBean>();
		try {
			String sql = "select * from producto where nombre like ? order by idproducto desc";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,"%" + filtro + "%");
			log.info(pstm);
			rs = pstm.executeQuery();
			ProductoBean bean = null;
			while(rs.next()){
				bean = new ProductoBean();
				bean.setIdProducto(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setDescripcion(rs.getString(3));
				bean.setPrecio(rs.getDouble(4));
				bean.setStock(rs.getInt(5));
				bean.setImagen(rs.getString(6));
				bean.setCategoria(rs.getString(7));
				bean.setFecRegistro(rs.getString(8));
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
	public List<ProductoBean> consultaProductoxCategoria(String cate) throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<ProductoBean> lista = new ArrayList<ProductoBean>();
		try {
			String sql = "select * from producto where categoria like ? order by idproducto desc";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,cate);
			log.info(pstm);
			rs = pstm.executeQuery();
			ProductoBean bean = null;
			while(rs.next()){
				bean = new ProductoBean();
				bean.setIdProducto(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setDescripcion(rs.getString(3));
				bean.setPrecio(rs.getDouble(4));
				bean.setStock(rs.getInt(5));
				bean.setImagen(rs.getString(6));
				bean.setCategoria(rs.getString(7));
				bean.setFecRegistro(rs.getString(8));
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
	public List<CantidadBean> cuentaProducto(String filtro) throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<CantidadBean> lista = new ArrayList<CantidadBean>();
		try {
			String sql = "select count(*) as cantidad from producto where nombre like ?";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,"%" + filtro + "%");
			log.info(pstm);
			rs = pstm.executeQuery();
			//ProductoBean bean = null;
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

	@Override
	public List<CantidadBean> cuentaProductoxCategoria(String cate) throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<CantidadBean> lista = new ArrayList<CantidadBean>();
		try {
			String sql = "select count(*) as cantidad from producto where categoria like ?";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,cate);
			log.info(pstm);
			rs = pstm.executeQuery();
			//ProductoBean bean = null;
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
	
	
	
	
	public static byte[] getBytesFromFile(File file) throws IOException {
        if (file != null) {
            InputStream is = new FileInputStream(file);
 
            byte[] bytes = new byte[(int) file.length()];
 
            int offset = 0;
            int numRead = 0;
            while (offset < bytes.length
                    && (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
                offset += numRead;
            }
 
            is.close();
            return bytes;
        } else {
            return null;
        }
    }
 
    public static File getFileFromBytes(byte[] fileBytes, String archivoDestino) {
        File f2 = null;
        try {
            f2 = new File(archivoDestino);
            OutputStream out = new FileOutputStream(f2);
            out.write(fileBytes);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f2;
 
    }

	@Override
	public List<ProductoBean> consultaNuevoProducto() throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<ProductoBean> lista = new ArrayList<ProductoBean>();
		try {
			String sql = "select * from producto order by idproducto desc limit 1";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			log.info(pstm);
			rs = pstm.executeQuery();
			ProductoBean bean = null;
			while(rs.next()){
				bean = new ProductoBean();
				bean.setIdProducto(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				bean.setDescripcion(rs.getString(3));
				bean.setPrecio(rs.getDouble(4));
				bean.setStock(rs.getInt(5));
				bean.setImagen(rs.getString(6));
				bean.setCategoria(rs.getString(7));
				bean.setFecRegistro(rs.getString(8));
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
