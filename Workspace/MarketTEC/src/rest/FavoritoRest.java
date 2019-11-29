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

import bean.FavoritoBean;
import bean.ProductoBean;
import dao.FavoritoDAO;
import dao.ProductoDAO;
import fabrica.Fabrica;


@Path("/favoritoRest")
public class FavoritoRest {
 
	private static final Log log = LogFactory.getLog(FavoritoRest.class);
	
	Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
	FavoritoDAO  dao = fabrica.getFavoritoDAO();

	//GET,POST,PUT,DELETE métodos del protocolo HTTP
	//La tecnología rest utiliza estos cuatro métodos
	//GET--->se va realiza un select
	//POST--->se va realiza un registrar
	//PUT--->se va realiza un actualizar
	//DELETE--->se va realiza un eliminar
	
	@GET
	@Path("/{idUsuario}")
	@Produces({ MediaType.APPLICATION_JSON })
	public Response consulta(@PathParam("idUsuario") int idUsuario) {
		log.info("consulta rest -> " + idUsuario);
		//if(idFavorito == 1) idFavorito ="";
		return Response.ok(dao.consultaFavorito(idUsuario)).build();
	}
	

	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	public int registra(FavoritoBean obj) {
		log.info("registra rest -> " + obj.getIdFavorito());
		return dao.insertaFavorito(obj);
	}

	
	@DELETE
	@Produces({ MediaType.APPLICATION_JSON })
	public int elimina(FavoritoBean obj) {
		log.info("elimina rest -> " + obj.getIdFavorito());
		return dao.eliminaFavorito(obj.getIdFavorito());
	}

 
}