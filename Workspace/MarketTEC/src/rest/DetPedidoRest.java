package rest;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import bean.DetPedidoBean;
import dao.PedidoDAO;
import fabrica.Fabrica;


@Path("/detPedidoRest")
public class DetPedidoRest {
 
	private static final Log log = LogFactory.getLog(DetPedidoRest.class);
	
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
	@Path("/{idPedido}")
	@Produces({ MediaType.APPLICATION_JSON })
	public Response consultaPedidoxUsuario(@PathParam("idPedido") int idPedido) {
		log.info("consulta rest -> " + idPedido);
		
		return Response.ok(dao.consultaDetPedido(idPedido)).build();
	}
	
	//Lista los pedidos x Usuario
	@GET
	@Path("/consultaDetPedidoxID/{idPedido}")
	@Produces({ MediaType.APPLICATION_JSON })
	public Response consultaDetPedidoxID(@PathParam("idPedido") int idPedido) {
		log.info("consulta rest -> " + idPedido);
		
		return Response.ok(dao.consultaDetPedidoxID(idPedido)).build();
	}

	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	public int registra(DetPedidoBean obj) {
		log.info("registra rest -> " + obj.getIdPedido());
		return dao.insertaDetPedido(obj);
	}
	
	
	
	
	
	
	

 
}