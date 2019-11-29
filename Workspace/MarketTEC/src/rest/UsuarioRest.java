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

import bean.UsuarioBean;
import dao.UsuarioDAO;
import fabrica.Fabrica;


@Path("/usuarioRest")
public class UsuarioRest {
 
	private static final Log log = LogFactory.getLog(UsuarioRest.class);
	
	Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
	UsuarioDAO  dao = fabrica.getUsuarioDAO();

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
		
		return Response.ok(dao.consultaUsuario("")).build();
	}
	
	@GET
	@Path("/{filtro}")
	@Produces({ MediaType.APPLICATION_JSON })
	public Response consulta(@PathParam("filtro") String filtro) {
		log.info("consulta rest -> " + filtro);
		if(filtro.equals("-1")) filtro ="";
		return Response.ok(dao.consultaUsuario(filtro)).build();
	}
	
	@GET
	@Path("/login/{correo}/{pass}")
	@Produces({ MediaType.APPLICATION_JSON })
	public Response login(@PathParam("correo") String correo, @PathParam("pass") String pass) {
		log.info("login rest -> " + correo);
		
		UsuarioBean usu = new UsuarioBean();
		usu.setCorreo(correo);
		usu.setPass(pass);
		
		return Response.ok(dao.login(usu)).build();
	}

	@POST
	@Produces({ MediaType.APPLICATION_JSON })
	public int registra(UsuarioBean obj) {
		log.info("registra rest -> " + obj.getNombres());
		return dao.insertaUsuario(obj);
	}

	@PUT
	@Produces({ MediaType.APPLICATION_JSON })
	public int actualiza(UsuarioBean obj) {
		log.info("actualiza rest -> " + obj.getNombres());
		return dao.actualizaUsuario(obj);
	}
	
	@DELETE
	@Produces({ MediaType.APPLICATION_JSON })
	public int elimina(UsuarioBean obj) {
		log.info("elimina rest -> " + obj.getIdUsuario());
		return dao.eliminaUsuario(obj.getIdUsuario());
	}

 
}