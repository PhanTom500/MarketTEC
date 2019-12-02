package dao;

import java.util.List;

import bean.DetPedidoBean;
import bean.PedidoBean;
import bean.TbDetPedidoBean;
import bean.TbPedidoBean;

public interface PedidoDAO {

	
	public abstract int insertaPedido(PedidoBean obj); //Cuando el usuario finaliza la compra del carrito
	public abstract int actualizaPedido(PedidoBean obj); //Para cambiar el estado del pedido
	public abstract int eliminaPedido(int idPedido); //Si el usuario cancela el pedido (NO SE USA)
	public abstract List<TbPedidoBean> consultaPedido(String nombre,String estado); //Filtro del CRUD -> se muestra en la tabla
	
	//DAOs para el detalle
	
	public abstract int insertaDetPedido(DetPedidoBean obj); //Insertar los productos al detalle del pedido
	public abstract List<PedidoBean> consultaPedidoxUsuario(int idUsuario); //El usuario visualiza el estado de sus pedidos
	public abstract List<PedidoBean> consultaUltimoPedidoxUsuario(int idUsuario); //El usuario visualiza el estado de sus pedidos
	
	//DAO para el detalle en tabla del crud
	
	public abstract List<TbDetPedidoBean> consultaDetPedido(int idPedido); //Se muestra en la tabla del modal
	public abstract List<DetPedidoBean> consultaDetPedidoxID(int idPedido);
	
	
	
	
	
	
}
