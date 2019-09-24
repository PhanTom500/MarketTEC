package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UsuarioBean;
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
		}else if(metodo.equals("login")){
			login(request, response);
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
		
		
		List<UsuarioBean> lista = null;
		try {
			UsuarioBean obj = new UsuarioBean(); 
			obj.setNombres(nom);
			obj.setCorreo(cor);
			obj.setPass(pas);

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
		
		List<UsuarioBean> lista = null;
		try {
			UsuarioBean obj = new UsuarioBean();
			obj.setIdUsuario(Integer.parseInt(id));
			obj.setNombres(nom);
			obj.setCorreo(cor);
			obj.setPass(pas);
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
		
		String cor = request.getParameter("correo");
		String pas = request.getParameter("pass");
		
		List<UsuarioBean> lista = null;
		try {
			UsuarioBean obj = new UsuarioBean();
			obj.setCorreo(cor);
			obj.setPass(pas);
			
			
			lista =  dao.login(obj);
			if(lista.size()==0) {
				
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
			
			if(lista.size()>0) {
				sess.setAttribute("user", lista.get(0));
				//response.sendRedirect("home");
				request.getRequestDispatcher("/index_user_log_log.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		//request.setAttribute("usuarios", lista);
		//request.getRequestDispatcher("/index_user_log.jsp").forward(request, response);
	}
	
	protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		
		try {
			
			sess.setAttribute("user", null);
			sess.invalidate();
				//response.sendRedirect("home");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			
			
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
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		//request.setAttribute("usuarios", lista);
		request.getRequestDispatcher("/index_user_log.jsp").forward(request, response);
	}
	
	protected void registralogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sess = request.getSession();
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		UsuarioDAO dao = fabrica.getUsuarioDAO();
		
		String nom = request.getParameter("nombres");
		String cor = request.getParameter("correo");
		String pas = request.getParameter("pass");
		
		
		
		try {
			UsuarioBean obj = new UsuarioBean(); 
			obj.setNombres(nom);
			obj.setCorreo(cor);
			obj.setPass(pas);

			dao.insertaUsuario(obj);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		//request.setAttribute("usuarios", lista);
		request.getRequestDispatcher("/index_user_log.jsp?nom=" + nom + "&cor=" + cor ).forward(request, response);
		
		
		
	}

}
