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

import bean.ProductoBean;
import dao.ProductoDAO;
import fabrica.Fabrica;


@Path("/productoRest")
public class ProductoRest {
 
	private static final Log log = LogFactory.getLog(ProductoRest.class);
	
	Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
	ProductoDAO  dao = fabrica.getProductoDAO();

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
		
		return Response.ok(dao.consultaProducto("")).build();
	}
	
	@GET
	@Path("/{filtro}")
	@Produces({ MediaType.APPLICATION_JSON })
	public Response consulta(@PathParam("filtro") String filtro) {
		log.info("consulta rest -> " + filtro);
		if(filtro.equals(null)) filtro ="";
		return Response.ok(dao.consultaProducto(filtro)).build();
	}
	
	@GET
	@Path("/consultaCate/{cate}")
	@Produces({ MediaType.APPLICATION_JSON })
	public Response consultaXCate(@PathParam("cate") String cate) {
		log.info("consulta cate rest -> " + cate);
		if(cate.equals("-1")) cate ="";
		return Response.ok(dao.consultaProductoxCategoria(cate)).build();
	}

	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	public int registra(ProductoBean obj) {
		log.info("registra rest -> " + obj.getNombre());
		return dao.insertaProducto(obj);
	}

	@PUT
	@Produces({ MediaType.APPLICATION_JSON })
	public int actualiza(ProductoBean obj) {
		log.info("actualiza rest -> " + obj.getNombre());
		return dao.actualizaProducto(obj);
	}
	
	@DELETE
	@Produces({ MediaType.APPLICATION_JSON })
	public int elimina(ProductoBean obj) {
		log.info("elimina rest -> " + obj.getIdProducto());
		return dao.eliminaProducto(obj.getIdProducto());
	}

 
}