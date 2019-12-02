package rest;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bean.PedidoBean;
import bean.ProductoBean;
import dao.PedidoDAO;
import dao.ProductoDAO;
import fabrica.Fabrica;


@Path("/pedidoRest")
public class PedidoRest {
 
	private static final Log log = LogFactory.getLog(PedidoRest.class);
	
	Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
	PedidoDAO  dao = fabrica.getPedidoDAO();

	//GET,POST,PUT,DELETE métodos del protocolo HTTP
	//La tecnología rest utiliza estos cuatro métodos
	//GET--->se va realiza un select
	//POST--->se va realiza un registrar
	//PUT--->se va realiza un actualizar
	//DELETE--->se va realiza un eliminar
	
	@GET
	@Path("/")
	@Produces({ MediaType.APPLICATION_JSON })
	public Response consultaTodos() {
		log.info("consulta TODOS rest -> "  );
		
		return Response.ok(dao.consultaPedido("", "")).build();
	}
	
	//Lista los pedidos x Usuario
	@GET
	@Path("/{idUsu}")
	@Produces({ MediaType.APPLICATION_JSON })
	public Response consultaPedidoxUsuario(@PathParam("idUsu") int idUsu) {
		log.info("consulta rest -> " + idUsu);
		
		return Response.ok(dao.consultaPedidoxUsuario(idUsu)).build();
	}

	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	public int registra(PedidoBean obj) {
		log.info("registra rest -> " + obj.getIdPedido());
		return dao.insertaPedido(obj);
	}

	@PUT
	@Produces({ MediaType.APPLICATION_JSON })
	public int actualiza(PedidoBean obj) {
		log.info("actualiza rest -> " + obj.getIdPedido());
		return dao.actualizaPedido(obj);
	}
	
	@DELETE
	@Produces({ MediaType.APPLICATION_JSON })
	public int elimina(PedidoBean obj) {
		log.info("elimina rest -> " + obj.getIdPedido());
		return dao.eliminaPedido(obj.getIdPedido());
	}
	
	//Para el carrito
	
	//Lista ultimo pedido del usuario
	@GET
	@Path("/ultPed/{idUsu}")
	@Produces({ MediaType.APPLICATION_JSON })
	public Response consultaUltimoPedidoxUsuario(@PathParam("idUsu") int idUsu) {
		log.info("consulta rest -> " + idUsu);
		
		return Response.ok(dao.consultaUltimoPedidoxUsuario(idUsu)).build();
	}
	
	
	
	
	

 
}