package dao;

import java.util.List;

import bean.CantidadBean;
import bean.ProductoBean;

public interface ProductoDAO {

	
	public abstract int eliminaProducto(int idProducto) throws Exception;
	public abstract int insertaProducto(ProductoBean obj) throws Exception;
	public abstract int actualizaProducto(ProductoBean obj) throws Exception;
	public abstract List<ProductoBean> consultaProducto(String filtro) throws Exception;
	public abstract List<ProductoBean> consultaProductoxCategoria(String cate) throws Exception;
	
	//Contar productos
	public abstract List<CantidadBean> cuentaProducto(String filtro) throws Exception;
	public abstract List<CantidadBean> cuentaProductoxCategoria(String cate) throws Exception;
	
	//Para mostrar el mas nuevo en index
	public abstract List<ProductoBean> consultaNuevoProducto() throws Exception;
	
	
}
