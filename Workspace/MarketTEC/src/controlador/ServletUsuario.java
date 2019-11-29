package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ProductoBean;
import bean.UsuarioBean;
import dao.ProductoDAO;
import dao.UsuarioDAO;
import fabrica.Fabrica;



@WebServlet("/usuario")
public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String metodo = request.getParameter("metodo");
		if(metodo.equals("lista")){
			lista(request, response);
		}else if(metodo.equals("registra")){
			registra(request, response);
		}else if(metodo.equals("elimina")){
			elimina(request, response);
		}else if(metodo.equals("actualiza")){
			actualiza(request, response);
		}else if(metodo.equals("home")){
			home(request, response);
		}else if(metodo.equals("login")){
			login(request, response);
		}else if(metodo.equals("logout")){
			logout(request, response);
		}else if(metodo.equals("loginAdmin")){
			loginAdmin(request, response);
		}else if(metodo.equals("registralogin")){
			registralogin(request, response);
		}
	}	
	protected void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		
		String filtro = request.getParameter("filtro");
		if(filtro == null) {
			filtro = "";
		}
		List<UsuarioBean> lista = null;
		try {
			lista =  dao.consultaUsuario(filtro);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("usuarios", lista);
		request.getRequestDispatcher("/crudUsuario.jsp").forward(request, response);
		//request.getRequestDispatcher("/login-admin2.jsp").forward(request, response);
	}	
	protected void registra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		
		String nom = request.getParameter("nombres");
		String cor = request.getParameter("correo");
		String pas = request.getParameter("pass");
		int tip = Integer.parseInt(request.getParameter("tipo"));
		
		
		List<UsuarioBean> lista = null;
		try {
			UsuarioBean obj = new UsuarioBean(); 
			obj.setNombres(nom);
			obj.setCorreo(cor);
			obj.setPass(pas);
			obj.setTipo(tip);

			dao.insertaUsuario(obj);
			lista =  dao.consultaUsuario("");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("usuarios", lista);
		request.getRequestDispatcher("/crudUsuario.jsp").forward(request, response);
		//request.getRequestDispatcher("/login-admin2.jsp").forward(request, response);
		
		
	}	
	protected void elimina(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		
		String id = request.getParameter("id");
		List<UsuarioBean> lista = null;
		try {
			dao.eliminaUsuario(Integer.parseInt(id));
			lista =  dao.consultaUsuario("");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("usuarios", lista);
		request.getRequestDispatcher("/crudUsuario.jsp").forward(request, response);
		//request.getRequestDispatcher("/login-admin2.jsp").forward(request, response);
	}	
	protected void actualiza(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		
		String id = request.getParameter("id");
		String nom = request.getParameter("nombres");
		String cor = request.getParameter("correo");
		String pas = request.getParameter("pass");
		int tip = Integer.parseInt(request.getParameter("tipo"));
		
		
		List<UsuarioBean> lista = null;
		try {
			UsuarioBean obj = new UsuarioBean();
			obj.setIdUsuario(Integer.parseInt(id));
			obj.setNombres(nom);
			obj.setCorreo(cor);
			obj.setPass(pas);
			obj.setTipo(tip);
			
			dao.actualizaUsuario(obj);
			lista =  dao.consultaUsuario("");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("usuarios", lista);
		request.getRequestDispatcher("/crudUsuario.jsp").forward(request, response);
		//request.getRequestDispatcher("/login-admin2.jsp").forward(request, response);
		
		
	}
	
	
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		ProductoDAO daoP = fabrica.getProductoDAO();
		
		String cor = request.getParameter("correo");
		String pas = request.getParameter("pass");
		String filtro = "";
		
		List<UsuarioBean> lista = null;
		List<ProductoBean> listaP = null;
		List<ProductoBean> nuevoP = null;
		try {
			UsuarioBean obj = new UsuarioBean();
			obj.setCorreo(cor);
			obj.setPass(pas);
			
			
			lista =  dao.login(obj);
			listaP =  daoP.consultaProducto(filtro);
			nuevoP = daoP.consultaNuevoProducto();
			
			if(lista.size()==0) {
				
				request.setAttribute("productos", listaP);
				request.setAttribute("nuevoP", nuevoP);
				
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
			
			if(lista.size()>0) {
				sess.setAttribute("user", lista.get(0));
				
				request.setAttribute("productos", listaP);
				request.setAttribute("nuevoP", nuevoP);
				ServletProducto sp=new ServletProducto();
				sp.pindex(request, response);
				//request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		//request.setAttribute("usuarios", lista);
		//request.getRequestDispatcher("/index_user_log.jsp").forward(request, response);
	}
	
	protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		
		ProductoDAO daoP = fabrica.getProductoDAO();
		
		String filtro = "";
		
		List<ProductoBean> listaP = null;
		List<ProductoBean> nuevoP = null;
		
		try {
			
			listaP =  daoP.consultaProducto(filtro);
			nuevoP = daoP.consultaNuevoProducto();
			
			sess.setAttribute("user", null);
			sess.invalidate();
			
			
			request.setAttribute("productos", listaP);
			request.setAttribute("nuevoP", nuevoP);
			ServletProducto sp=new ServletProducto();
			sp.pindex(request, response);
			//response.sendRedirect("home");
			//request.getRequestDispatcher("/index.jsp").forward(request, response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}
	
	protected void loginAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		
		
		String cor = request.getParameter("correo");
		String pas = request.getParameter("pass");
		
		List<UsuarioBean> lista = null;
		try {
			UsuarioBean obj = new UsuarioBean();

			obj.setCorreo(cor);
			obj.setPass(pas);
			
			
			lista =  dao.loginAdmin(obj);
			if(lista.size()==0) {
				
				request.getRequestDispatcher("/Admin-Login.jsp").forward(request, response);
			}
			
			if(lista.size()>0) {
				sess.setAttribute("user", lista.get(0));
				//response.sendRedirect("home");
				request.getRequestDispatcher("/login-admin2.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		//request.setAttribute("usuarios", lista);
		//request.getRequestDispatcher("/index_user_log.jsp").forward(request, response);
	}
	
	protected void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		System.out.println("En home");
		try {
			if(sess.getAttribute("user")!=null) {
				//request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		//request.setAttribute("usuarios", lista);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
	
	protected void registralogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		
		String nom = request.getParameter("nombres");
		String cor = request.getParameter("correo");
		String pas = request.getParameter("pass");
		
		if (nom != null || cor != null || pas != null) {
			
		}
		
		
		
		try {
			UsuarioBean obj = new UsuarioBean(); 
			obj.setNombres(nom);
			obj.setCorreo(cor);
			obj.setPass(pas);
			obj.setTipo(0);

			dao.insertaUsuario(obj);
			
			//JOptionPane.showConfirmDialog(null, "Nice");
			
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		//request.setAttribute("usuarios", lista);
		
		
		
		
	}

}
