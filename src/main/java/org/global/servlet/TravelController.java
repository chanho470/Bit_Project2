package org.global.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.global.beans.Air;
import org.global.beans.Cart;
import org.global.beans.Hotel;
import org.global.beans.Product;
import org.global.beans.UserInfo;
import org.global.daos.TravelDAO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.do")
public class TravelController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TravelController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String uri = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = uri.substring(ctxPath.length());
		TravelDAO dao = TravelDAO.getInstance();
		System.out.println(cmd);
		try {

			if (cmd.equals("/homeProc.do")) {
				homeProc(request, response, dao);
			} else if (cmd.equals("/addList.do")) {
				addList(request, response, dao);
			} else if (cmd.equals("/booking.do")) {
				booking(request, response, dao);
			} else if (cmd.equals("/detail.do")) {
				detail(request, response, dao);
			} else if (cmd.equals("/orderComplete.do")) {
				orderComplete(request, response, dao);
			} else if (cmd.equals("/dropUser.do")) {
				dropProc(request, response, dao);
			} else if (cmd.equals("/joinUser.do")) {
				joinUser(request, response, dao);
			} else if (cmd.equals("/loginProc.do")) {
				loginProc(request, response, dao);
			} else if (cmd.equals("/logoutProc.do")) {
				logoutProc(request, response, dao);
			} else if (cmd.equals("/modifyProc.do")) {
				modifyProc(request, response, dao);
			} else if (cmd.equals("/recommendAll.do")) {
				recommendAll(request, response, dao);
			} else if (cmd.equals("/recommendProc.do")) {
				recommendProc(request, response, dao);
			} else if (cmd.equals("/ProductProc.do")) {
				ProductProc(request, response, dao);
			} else if (cmd.equals("/reservation.do")) {
				reservation(request, response, dao);
			} else if (cmd.equals("/updateProduct.do")) {// 여기부터 추가
				updateProduct(request, response, dao);
			} else if (cmd.equals("/updateAir.do")) {
				updateAir(request, response, dao);
			} else if (cmd.equals("/updateHotel.do")) {
				updateHotel(request, response, dao);
			} else if (cmd.equals("/selectAll.do")) {
				selectAll(request, response, dao);
			} else if (cmd.equals("/deleteProduct.do")) {
				deleteProduct(request, response, dao);
			} else if (cmd.equals("/deleteAir.do")) {
				deleteAir(request, response, dao);
			} else if (cmd.equals("/deleteHotel.do")) {
				deleteHotel(request, response, dao);
			}
		} catch (SQLException | ServletException | IOException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void homeProc(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		List<Product> list = new ArrayList<Product>();

		list = dao.Home();

		request.setAttribute("List_Home", list);
		RequestDispatcher rd = request.getRequestDispatcher("/html/home.jsp");
		rd.include(request, response);
	}

	public void reservation(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws ServletException, IOException, NamingException {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();

		String userId = (String) session.getAttribute("userId");

		ArrayList<Cart> res = dao.Reservation(userId);

		request.setAttribute("res", res);

		RequestDispatcher rd = request.getRequestDispatcher("/html/reservation.jsp");
		rd.include(request, response);
		// rd.forward(request, response);
	}

	public void addList(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<Cart> CartList = (ArrayList<Cart>) session.getAttribute("CartList");

		if (CartList == null) {
			CartList = new ArrayList<Cart>();
			session.setAttribute("CartList", CartList);
		}
		String type = request.getParameter("type");
		Cart cartResult = new Cart();

		if (type.equals("상품")) {

			String proName = request.getParameter("proName");
			String date = request.getParameter("date");
			String option = request.getParameter("option1").split(":")[0] + "/";
			option += request.getParameter("option2") + "명";
			int price = Integer.parseInt(request.getParameter("price"));
			cartResult = new Cart(proName, date, option, price, type);

		} else if (type.equals("항공")) {

			String indexNo = (String) request.getParameter("indexNo");
			int num = Integer.parseInt(request.getParameter("num"));
			cartResult = dao.selectAir(indexNo, num, type);

		} else if (type.equals("숙박")) {

			String indexNo = (String) request.getParameter("indexNo");
			int num = Integer.parseInt(request.getParameter("num"));
			cartResult = dao.selectHotel(indexNo, num, type);
			cartResult.setDate(request.getParameter("dateStart") + " ~ " + request.getParameter("dateEnd"));

		}

		CartList.add(cartResult);

		RequestDispatcher rd = request.getRequestDispatcher("/html/taxbill.jsp");
		rd.forward(request, response);
	}

	public void booking(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws ServletException, IOException {
		ArrayList<Air> airList = dao.selectAllAir();
		ArrayList<Hotel> hotelList = dao.selectAllHotel();

		request.setAttribute("airList", airList);
		request.setAttribute("hotelList", hotelList);
		RequestDispatcher rd = request.getRequestDispatcher("/html/booking.jsp");
		rd.forward(request, response);

	}

	public void detail(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws ServletException, IOException {
		int indexNo = Integer.parseInt(request.getParameter("p"));
		Product pro = dao.selectProduct(indexNo); // productId 입력
		request.setAttribute("pro", pro);
		RequestDispatcher rd = request.getRequestDispatcher("/html/detail.jsp");
		rd.forward(request, response);
	}

	public void orderComplete(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<Cart> CartList = (ArrayList<Cart>) session.getAttribute("CartList");
		String userId = (String) session.getAttribute("userId");

		if (CartList == null) {
			CartList = new ArrayList<Cart>();
			session.setAttribute("CartList", CartList);
		}

		for (Cart cart : CartList) {
			dao.insertOrder(userId, cart);
		}

		session.removeAttribute("CartList");
		RequestDispatcher rd = request.getRequestDispatcher("/html/orderComplete.jsp");
		rd.forward(request, response);
	}

	public void dropProc(HttpServletRequest request, HttpServletResponse response, TravelDAO dao) throws IOException {

		HttpSession session = request.getSession();
		dao.deleteUser((String) session.getAttribute("userId"));
		session.removeAttribute("userId");
		session.removeAttribute("userPwd");

		response.sendRedirect(request.getContextPath() + "/homeProc.do");
	}

	public void joinUser(HttpServletRequest request, HttpServletResponse response, TravelDAO dao) throws IOException {

		String name = request.getParameter("name");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String email = request.getParameter("email");
		String phoneNo = request.getParameter("phoneNo");
		String address = request.getParameter("address");

		UserInfo user = new UserInfo(name, userId, userPwd, email, phoneNo, address);
		dao.insertUser(user);

		response.sendRedirect(request.getContextPath() + "/homeProc.do");

	}

	public void loginProc(HttpServletRequest request, HttpServletResponse response, TravelDAO dao) throws IOException {
		String userId = request.getParameter("ID");
		String userPwd = request.getParameter("PassWord");
		HttpSession session = request.getSession();

		if (dao.selectUser(userId, userPwd)) {
			session.setAttribute("userId", userId);
			session.setAttribute("userPwd", userPwd);

			response.sendRedirect(request.getContextPath() + "/homeProc.do");

		} else {
			response.sendRedirect(request.getContextPath() + "/homeProc.do");
		}
	}

	public void logoutProc(HttpServletRequest request, HttpServletResponse response, TravelDAO dao) throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userPwd");
		response.sendRedirect(request.getContextPath() + "/homeProc.do");
	}

	public void modifyProc(HttpServletRequest request, HttpServletResponse response, TravelDAO dao) throws IOException {

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		String name = request.getParameter("name");
		String userPwd = request.getParameter("userPwd");
		String email = request.getParameter("email");
		String phoneNo = request.getParameter("phoneNo");
		String address = request.getParameter("address");

		UserInfo user = new UserInfo(name, userId, userPwd, email, phoneNo, address);
		dao.updateUser(user);
		response.sendRedirect(request.getContextPath() + "/homeProc.do"); 
	}

	public void recommendAll(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws IOException, ServletException {

		String a = "Asia";
		String na = "NorthA";
		String e = "Europe";
		String sa = "SouthA";
		String o = "Oceania";

		String[] con = { a, na, e, sa, o };
		int[] count = new int[5];
		HttpSession session = request.getSession();
		ArrayList<Product> al = dao.selectAllProduct();
		session.setAttribute("list_r", al);
		session.setAttribute("con", con);
		for (int i = 0; i < 5; i++) {
			count[i] = dao.countList(con[i]);
		}
		session.setAttribute("count", count);
		RequestDispatcher rd = request.getRequestDispatcher("/html/recommend.jsp");
		rd.forward(request, response);
	}

	public void recommendProc(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws SQLException, ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("list_r");

		String NorthA_s = request.getParameter("NorthA");
		String Europe_s = request.getParameter("Europe");
		String Asia_s = request.getParameter("Asia");
		String SouthA_s = request.getParameter("SouthA");
		String Oceania_s = request.getParameter("Oceania");
		String AllList = request.getParameter("AllList");

		ArrayList<Product> al = new ArrayList<Product>();
		if (request.getParameter("p").equals("NorthA")) { // 나라이름 검색 해당하는 검색만 가능하도록
			if (NorthA_s.equals("")) {
				al = dao.continentSearch("NorthA");
			} else {
				al = dao.detailSearch(request.getParameter("p"), NorthA_s);
				System.out.println("글" + NorthA_s);
			}
		} else if (request.getParameter("p").equals("Europe")) {

			if (Europe_s.equals("")) {
				al = dao.continentSearch("Europe");
			} else {
				al = dao.detailSearch(request.getParameter("p"), Europe_s);
			}

		} else if (request.getParameter("p").equals("Asia")) {

			if (Asia_s.equals("")) {
				al = dao.continentSearch("Asia");
			} else {
				al = dao.detailSearch(request.getParameter("p"), Asia_s);
			}

		} else if (request.getParameter("p").equals("SouthA")) {

			if (SouthA_s.equals("")) {
				al = dao.continentSearch("SouthA");
			} else {
				al = dao.detailSearch(request.getParameter("p"), SouthA_s);
			}
		} else if (request.getParameter("p").equals("Oceania")) {

			if (Oceania_s.equals("")) {
				al = dao.continentSearch("Oceania");
			} else {
				al = dao.detailSearch(request.getParameter("p"), Oceania_s);
			}
		} else if (request.getParameter("p").equals("All")) {
			if (AllList.equals("")) {
				al = dao.selectAllProduct();
			} else {
				al = dao.detailSearchAll(AllList);
			}
		}
		request.setAttribute("list_r", al);
		RequestDispatcher rd = request.getRequestDispatcher("/html/recommend.jsp");
		rd.forward(request, response);
	}

	public void ProductProc(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws ServletException, IOException, NamingException, SQLException {
		request.setCharacterEncoding("UTF-8");

		response.setContentType("text/html;charset=UTF-8");

		ArrayList<Product> Asia = dao.continentSearch("Asia");
		ArrayList<Product> Other = dao.continentSearchOther("Asia");
		HttpSession session = request.getSession();
		session.setAttribute("Asia", Asia);
		session.setAttribute("Other", Other);

		RequestDispatcher rd = request.getRequestDispatcher("/html/productList.jsp");
		rd.forward(request, response);
	}

	public void updateProduct(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws IOException {

		ServletContext application = getServletContext();
		String path = application.getRealPath("/images");
		int size = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();
		String name = (String) files.nextElement();
		String file = multi.getFilesystemName(name);

		String proName = multi.getParameter("proName");
		int price = Integer.parseInt(multi.getParameter("price"));
		String continent = multi.getParameter("continent");
		String nation = multi.getParameter("nation");
		String address = multi.getParameter("address");
		String date = multi.getParameter("date");
		String tel = multi.getParameter("tel");
		String text = multi.getParameter("text");
		String detailtext = multi.getParameter("detailtext");
		String hashTag = multi.getParameter("hashTag");
		String mapurl = multi.getParameter("mapurl");
		String img_root = file;
		String options = multi.getParameter("options");

		Product pro = new Product(proName, price, continent, nation, address, date, tel, text, detailtext, hashTag,
				mapurl, img_root, options);
		dao.insertProduct(pro);

		response.sendRedirect(request.getContextPath() + "/html/adminAdd.jsp");
	}

	public void updateAir(HttpServletRequest request, HttpServletResponse response, TravelDAO dao) throws IOException {
		ServletContext application = getServletContext();
		String path = application.getRealPath("/images");
		int size = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();
		String name = (String) files.nextElement();
		String file = multi.getFilesystemName(name);

		String imgurl = file;
		String toair = multi.getParameter("toair");
		String formair = multi.getParameter("formair");
		String boardingTime = multi.getParameter("boardingTime");
		String departureTime = multi.getParameter("departuretime");
		String classAir = multi.getParameter("class");
		int price = Integer.parseInt(multi.getParameter("price"));

		Air air = new Air(imgurl, toair, formair, boardingTime, departureTime, classAir, price);
		dao.insertAir(air);

		response.sendRedirect(request.getContextPath() + "/html/adminAdd.jsp");
	}

	public void updateHotel(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws IOException {
		ServletContext application = getServletContext();
		String path = application.getRealPath("/images");
		int size = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();
		String name = (String) files.nextElement();
		String file = multi.getFilesystemName(name);

		String imgurl = file;
		String nameHotel = multi.getParameter("proName");
		String classHotel = multi.getParameter("class");
		String checkin = multi.getParameter("checkin");
		String checkout = multi.getParameter("checkout");
		String nation = multi.getParameter("nation");
		String address = multi.getParameter("address");
		int price = Integer.parseInt(multi.getParameter("price"));

		Hotel hotel = new Hotel(imgurl, nameHotel, classHotel, checkin, checkout, nation, address, price);
		dao.insertHotel(hotel);

		response.sendRedirect(request.getContextPath() + "/html/adminAdd.jsp");
	}

	public void deleteProduct(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws IOException {
		String[] indexs = request.getParameter("list").split(",");
		for (String i : indexs) {
			dao.deleteProduct(Integer.parseInt(i));
		}
		response.sendRedirect(request.getContextPath()+"/selectAll.do");
	}

	public void deleteAir(HttpServletRequest request, HttpServletResponse response, TravelDAO dao) throws IOException {
		String[] indexs = request.getParameter("list").split(",");
		for (String i : indexs) {
			dao.deleteAir(Integer.parseInt(i));
		}
		response.sendRedirect(request.getContextPath()+"/selectAll.do");

	}

	public void deleteHotel(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws IOException {
		String[] indexs = request.getParameter("list").split(",");
		for (String i : indexs) {
			dao.deleteHotel(Integer.parseInt(i));
		}
		response.sendRedirect(request.getContextPath()+"/selectAll.do");
	}

	public void selectAll(HttpServletRequest request, HttpServletResponse response, TravelDAO dao)
			throws IOException, ServletException {
		ArrayList<Product> proList = dao.selectAllProduct();
		ArrayList<Air> airList = dao.selectAllAir();
		ArrayList<Hotel> hotelList = dao.selectAllHotel();

		request.setAttribute("proList", proList);
		request.setAttribute("airList", airList);
		request.setAttribute("hotelList", hotelList);
		RequestDispatcher rd = request.getRequestDispatcher("html/adminDelete.jsp");
		rd.forward(request, response);
	}
}
