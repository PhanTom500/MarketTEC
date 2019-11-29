package controlador;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CantidadBean;
import bean.DetFavoritoBean;
import bean.FavoritoBean;
import bean.ProductoBean;
import dao.FavoritoDAO;
import dao.ProductoDAO;
import fabrica.Fabrica;



@WebServlet("/producto")
public class ServletProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Date fechaActual=new Date();
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String metodo = request.getParameter("metodo");
		if(metodo.equals("lista")){
			lista(request, response);
		}else if(metodo.equals("registra")){
			registra(request, response);
		}else if(metodo.equals("elimina")){
			elimina(request, response);
		}else if(metodo.equals("ptienda")){
			ptienda(request, response);
		}else if(metodo.equals("pindex")){
			pindex(request, response);
		}else if(metodo.equals("tiendaXcate")){
			tiendaXcate(request, response);
		}else if(metodo.equals("listaFav")){
			listaFav(request, response);
		}else if(metodo.equals("registraFav")){
			registraFav(request, response);
		}else if(metodo.equals("eliminaFav")){
			eliminaFav(request, response);
		}else if(metodo.equals("actualiza")){
			actualiza(request, response);
		}
	}	
	
	//Acciones del crud de Producto
	
	protected void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProductoDAO dao = fabrica.getProductoDAO();
		
		String filtro = request.getParameter("filtro");
		if(filtro == null) {
			filtro = "";
		}
		
		List<ProductoBean> lista = null;
		try {
			lista =  dao.consultaProducto(filtro);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("productos", lista);
		request.getRequestDispatcher("/crudProducto.jsp").forward(request, response);
		
	}
	
	protected void registra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProductoDAO dao = fabrica.getProductoDAO();
		
		String nom = request.getParameter("nombre");
		String des = request.getParameter("descripcion");
		double pre = Double.parseDouble(request.getParameter("precio")); 
		int stk = Integer.parseInt(request.getParameter("stock"));
		String img = request.getParameter("imagen");
		String cat = request.getParameter("categoria");
		String fec = sdf.format(fechaActual);
		
		
		List<ProductoBean> lista = null;
		try {
			ProductoBean obj = new ProductoBean(); 
			obj.setNombre(nom);
			obj.setDescripcion(des);
			obj.setPrecio(pre);
			obj.setStock(stk);
			obj.setImagen(img);
			obj.setCategoria(cat);
			obj.setFecRegistro(fec);

			dao.insertaProducto(obj);
			lista =  dao.consultaProducto("");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("productos", lista);
		request.getRequestDispatcher("/crudProducto.jsp").forward(request, response);
		//request.getRequestDispatcher("/login-admin2.jsp").forward(request, response);
	}
	
	protected void elimina(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProductoDAO dao = fabrica.getProductoDAO();
		
		String id = request.getParameter("id");
		List<ProductoBean> lista = null;
		try {
			dao.eliminaProducto(Integer.parseInt(id));
			lista =  dao.consultaProducto("");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("productos", lista);
		request.getRequestDispatcher("/crudProducto.jsp").forward(request, response);
		//request.getRequestDispatcher("/login-admin2.jsp").forward(request, response);
	}
	
	protected void actualiza(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProductoDAO dao = fabrica.getProductoDAO();
		
		String id = request.getParameter("id");
		String nom = request.getParameter("nombre");
		String des = request.getParameter("descripcion");
		double pre = Double.parseDouble(request.getParameter("precio")); 
		int stk = Integer.parseInt(request.getParameter("stock"));
		String img = request.getParameter("imagen");
		String cat = request.getParameter("categoria");
		String fec = sdf.format(fechaActual);
		
		List<ProductoBean> lista = null;
		try {
			ProductoBean obj = new ProductoBean();
			obj.setIdProducto(Integer.parseInt(id));
			obj.setNombre(nom);
			obj.setDescripcion(des);
			obj.setPrecio(pre);
			obj.setStock(stk);
			obj.setImagen(img);
			obj.setCategoria(cat);
			obj.setFecRegistro(fec);
			dao.actualizaProducto(obj);
			lista =  dao.consultaProducto("");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("productos", lista);
		request.getRequestDispatcher("/crudProducto.jsp").forward(request, response);
		//request.getRequestDispatcher("/login-admin2.jsp").forward(request, response);
	}
	
	//Sección de Tienda
	
	protected void ptienda(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProductoDAO dao = fabrica.getProductoDAO();
		FavoritoDAO daoFav = fabrica.getFavoritoDAO();
		
		
		String filtro = request.getParameter("filtro");
		
		
		if(filtro == null)
			filtro = "";
		List<ProductoBean> lista = null;
		List<CantidadBean> can = null;


		try {
			lista =  dao.consultaProducto(filtro);
			can = dao.cuentaProducto(filtro);

		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("productos", lista);
		request.setAttribute("cantproductos", can);
		request.getRequestDispatcher("/tienda.jsp").forward(request, response);
		
	}
	
	protected void tiendaXcate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProductoDAO dao = fabrica.getProductoDAO();
		
		String cate = request.getParameter("cate");
		if(cate == null)
			cate = "";
		List<ProductoBean> lista = null;
		List<CantidadBean> can = null;
		try {
			lista =  dao.consultaProductoxCategoria(cate);
			can = dao.cuentaProductoxCategoria(cate);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("productos", lista);
		request.setAttribute("cantproductos", can);
		request.getRequestDispatcher("/tienda.jsp").forward(request, response);
		
	}
	
	//Carga de productos del index
	
	protected void pindex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProductoDAO dao = fabrica.getProductoDAO();
		
		
		String filtro = "";
		
		List<ProductoBean> lista = null;
		List<ProductoBean> nuevoP = null;

		try {
			lista =  dao.consultaProducto(filtro);
			nuevoP = dao.consultaNuevoProducto();

		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("productos", lista);
		request.setAttribute("nuevoP", nuevoP);

		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
	}
	
	// LISTA DE FAVORITOS
	
	protected void listaFav(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		FavoritoDAO dao = fabrica.getFavoritoDAO();
		
		int usu = Integer.parseInt(request.getParameter("idUsuario"));
		
		List<DetFavoritoBean> lista = null;
		List<CantidadBean> can = null;
		try {
			lista =  dao.consultaFavorito(usu);
			can = dao.cuentaFavorito(usu);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("favoritos", lista);
		request.setAttribute("cantFavoritos", can);
		request.getRequestDispatcher("/favoritos.jsp").forward(request, response);
		
	}
	
	protected void eliminaFav(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		FavoritoDAO dao = fabrica.getFavoritoDAO();
		
		int usu = Integer.parseInt(request.getParameter("idUsuario"));
		String idPro = request.getParameter("id");
		List<DetFavoritoBean> lista = null;
		try {
			dao.eliminaFavorito(Integer.parseInt(idPro));
			lista =  dao.consultaFavorito(usu);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		request.setAttribute("favoritos", lista);
		
		listaFav(request, response);
		
		//request.getRequestDispatcher("/favoritos.jsp").forward(request, response);
		
	}
	
	protected void registraFav(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		FavoritoDAO dao = fabrica.getFavoritoDAO();
		
		int idUsu = Integer.parseInt(request.getParameter("idUsu"));
		int idPro = Integer.parseInt(request.getParameter("idPro"));
		
		List<DetFavoritoBean> lista = null;
		List<CantidadBean> can = null;
		try {
			FavoritoBean obj = new FavoritoBean(); 
			obj.setIdUsuario(idUsu);
			obj.setIdProducto(idPro);

			dao.insertaFavorito(obj);
			
			lista =  dao.consultaFavorito(idUsu);
			can = dao.cuentaFavorito(idUsu);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("favoritos", lista);
		request.setAttribute("cantFavoritos", can);
		request.getRequestDispatcher("/favoritos.jsp").forward(request, response);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	public static byte[] getBytesFromFile(File file) throws IOException {
        if (file != null) {
            InputStream is = new FileInputStream(file);
 
            byte[] bytes = new byte[(int) file.length()];
 
            int offset = 0;
            int numRead = 0;
            while (offset < bytes.length
                    && (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
                offset += numRead;
            }
 
            is.close();
            return bytes;
        } else {
            return null;
        }
    }
 
    public static File getFileFromBytes(byte[] fileBytes, String archivoDestino) {
        File f2 = null;
        try {
            f2 = new File(archivoDestino);
            OutputStream out = new FileOutputStream(f2);
            out.write(fileBytes);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f2;
 
    }
	
	
	

}
