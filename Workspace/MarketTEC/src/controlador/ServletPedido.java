package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import bean.CantidadBean;
import bean.DetPedidoBean;
import bean.PedidoBean;
import bean.ProductoBean;
import bean.TbDetPedidoBean;
import bean.TbPedidoBean;
import dao.PedidoDAO;
import dao.ProductoDAO;
import fabrica.Fabrica;

@WebServlet("/pedido")
public class ServletPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Date fechaActual = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	private List<ProductoBean> carritoProductos = new ArrayList<ProductoBean>();
	
	private List<CantidadBean> cantProductos = new ArrayList<CantidadBean>();

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String metodo = request.getParameter("metodo");
		if (metodo.equals("lista")) {
			lista(request, response);
		} else if (metodo.equals("registra")) {
			registra(request, response);
		} else if (metodo.equals("elimina")) {
			elimina(request, response);
		} else if (metodo.equals("carrito")) {
			carrito(request, response);
		} else if (metodo.equals("eliminaCarrito")) {
			eliminaCarrito(request, response);
		} else if (metodo.equals("listaDetalle")) {
			listaDetalle(request, response);
		} else if (metodo.equals("listaPedidoPorUsuario")) {
			listaPedidoPorUsuario(request, response);
		} else if (metodo.equals("actualiza")) {
			actualiza(request, response);
		}
	}

	// Acciones del crud de Pedido

	protected void lista(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		PedidoDAO dao = fabrica.getPedidoDAO();

		String nombre = request.getParameter("filtro1");
		if (nombre == null) {
			nombre = "";
		}
		String estado = request.getParameter("filtro2");
		if (estado == null) {
			estado = "";
		}

		List<TbPedidoBean> lista = null;
		try {
			lista = dao.consultaPedido(nombre, estado);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("pedidos", lista);
		request.getRequestDispatcher("/crudPedido.jsp").forward(request, response);

	}

	protected void registra(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sess = request.getSession();
		ServletProducto sp = new ServletProducto();
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		PedidoDAO dao = fabrica.getPedidoDAO();

		int idUsu = Integer.parseInt(request.getParameter("idUsuario"));
		String fec = sdf.format(fechaActual);
		String est = "Pendiente";
		
		if (sess.getAttribute("listaCarrito") != null) {
			carritoProductos = (ArrayList<ProductoBean>) sess.getAttribute("listaCarrito");
			cantProductos = (ArrayList<CantidadBean>) sess.getAttribute("cantProdCarrito");
		}

		try {
			// Crea el pedido
			PedidoBean obj = new PedidoBean();
			obj.setIdUsuario(idUsu);
			obj.setFechaRegistro(fec);
			obj.setEstado(est);
			
			dao.insertaPedido(obj);

			// Crea el detalle de pedido
			
			List<PedidoBean> pedi = null;
			pedi = dao.consultaUltimoPedidoxUsuario(idUsu);
			int idPed = pedi.get(0).getIdPedido();
			
			for (int i = 0; i < carritoProductos.size(); i++) {
				int cant = cantProductos.get(i).getCantidad();
				double precio = carritoProductos.get(i).getPrecio();
				double subtotal = cant * precio;
				
				DetPedidoBean objDet = new DetPedidoBean();
				objDet.setIdPedido(idPed);
				objDet.setIdProducto(carritoProductos.get(i).getIdProducto());
				objDet.setCantidad(cant);
				objDet.setPrecio(subtotal);
				
				dao.insertaDetPedido(objDet);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//Limpiar el carrito
		carritoProductos.clear();
		cantProductos.clear();
		sess.setAttribute("listaCarrito", null);
		sess.setAttribute("cantProdCarrito", null);
		
		sp.pindex(request, response);

		

	}

	protected void elimina(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProductoDAO dao = fabrica.getProductoDAO();

		String id = request.getParameter("id");
		List<ProductoBean> lista = null;
		try {
			dao.eliminaProducto(Integer.parseInt(id));
			lista = dao.consultaProducto("");
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("productos", lista);
		request.getRequestDispatcher("/crudProducto.jsp").forward(request, response);
	}

	protected void actualiza(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		PedidoDAO dao = fabrica.getPedidoDAO();

		String id = request.getParameter("id");
		String est = request.getParameter("estado");

		List<TbPedidoBean> lista = null;
		try {
			PedidoBean obj = new PedidoBean();
			obj.setIdPedido(Integer.parseInt(id));
			obj.setEstado(est);

			dao.actualizaPedido(obj);
			lista = dao.consultaPedido("", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("pedidos", lista);
		request.getRequestDispatcher("/crudPedido.jsp").forward(request, response);
	}

	// Tabla del modal

	protected void listaDetalle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		PedidoDAO dao = fabrica.getPedidoDAO();

		int idPedido = Integer.parseInt(request.getParameter("id"));

		List<TbDetPedidoBean> lista = null;
		try {
			lista = dao.consultaDetPedido(idPedido);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// A Formato JSON
		Gson gson = new Gson();
		String json = gson.toJson(lista);
		System.out.println(json);

		// Notificamos el tipo de archivo que se envía al browser
		response.setContentType("application/json;charset=UTF-8");

		// Se genera el archivo JSON y se envía al browser
		PrintWriter out = response.getWriter();
		out.println(json);

	}

	// Carrito

	protected void carrito(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		// PedidoDAO dao = fabrica.getPedidoDAO();
		ProductoDAO proDAO = fabrica.getProductoDAO();

		HttpSession sess = request.getSession();
		
		int idProducto = Integer.parseInt(request.getParameter("idProd"));
		int cantProd = Integer.parseInt(request.getParameter("cantidad"));

		if (sess.getAttribute("listaCarrito") != null) {
			carritoProductos = (ArrayList<ProductoBean>) sess.getAttribute("listaCarrito");
			cantProductos = (ArrayList<CantidadBean>) sess.getAttribute("cantProdCarrito");
		}
		

		try {
			// se quiere agregar uno nuevo
			List<ProductoBean> e = proDAO.consultaProductoxID(idProducto);
			
			CantidadBean canBean = new CantidadBean();
			canBean.setCantidad(cantProd);
			
			boolean exist = false;
			if (e.size() > 0) {

				for (ProductoBean y : carritoProductos) {
					if (y.getIdProducto() == e.get(0).getIdProducto()) {
						exist = true;
						break;
					}
				}
				
				if (exist == true) {

					//response.sendRedirect("/carrito.jsp");
					//request.getRequestDispatcher("/carrito.jsp").forward(request, response);
				} else {

					carritoProductos.add(e.get(0));
					cantProductos.add(canBean);
					sess.setAttribute("listaCarrito", carritoProductos);
					sess.setAttribute("cantProdCarrito", cantProductos);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// request.setAttribute("pedidos", lista);
		request.getRequestDispatcher("/carrito.jsp").forward(request, response);

	}
	

	protected void eliminaCarrito(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		// PedidoDAO dao = fabrica.getPedidoDAO();
		ProductoDAO proDAO = fabrica.getProductoDAO();

		HttpSession sess = request.getSession();

		try {
			if (sess.getAttribute("listaCarrito") != null) {
				carritoProductos = (ArrayList<ProductoBean>) sess.getAttribute("listaCarrito");
				cantProductos = (ArrayList<CantidadBean>) sess.getAttribute("cantProdCarrito");
			}

			for (ProductoBean b : carritoProductos) {
				if (b.getIdProducto() == Integer.valueOf(request.getParameter("id"))) {
					carritoProductos.remove(b);
					//cantProductos.remove(b.);
					break;
				}
			}
			// response.sendRedirect("carrito");
			// request.getRequestDispatcher("/carrito.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// request.setAttribute("pedidos", lista);
		request.getRequestDispatcher("/carrito.jsp").forward(request, response);

	}
	
	//Tabla de pedidos que visualiza el usuario
	
	protected void listaPedidoPorUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		PedidoDAO dao = fabrica.getPedidoDAO();

		int idUsu = Integer.parseInt(request.getParameter("idUsuario"));

		List<PedidoBean> lista = null;
		try {
			lista = dao.consultaPedidoxUsuario(idUsu);
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.setAttribute("pedidosUsu", lista);
		request.getRequestDispatcher("/datos_email_log.jsp").forward(request, response);

	}

}
