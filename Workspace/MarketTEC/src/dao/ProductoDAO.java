package dao;

import java.util.List;

import bean.CantidadBean;
import bean.ProductoBean;

public interface ProductoDAO {

	
	public abstract int eliminaProducto(int idProducto);
	public abstract int insertaProducto(ProductoBean obj);
	public abstract int actualizaProducto(ProductoBean obj);
	public abstract List<ProductoBean> consultaProducto(String filtro);
	public abstract List<ProductoBean> consultaProductoxCategoria(String cate);
	
	//Contar productos
	public abstract List<CantidadBean> cuentaProducto(String filtro);
	public abstract List<CantidadBean> cuentaProductoxCategoria(String cate);
	
	//Para mostrar el mas nuevo en index
	public abstract List<ProductoBean> consultaNuevoProducto();
	
	//Para el carrito
	public abstract List<ProductoBean> consultaProductoxID(int id);
	
	
}
