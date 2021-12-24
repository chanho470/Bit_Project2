package org.global.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.global.beans.Air;
import org.global.beans.Cart;
import org.global.beans.Hotel;
import org.global.beans.Product;
import org.global.beans.UserInfo;

public class TravelDAO {
	private static TravelDAO dao = new TravelDAO();

	private TravelDAO() {
	}

	public static TravelDAO getInstance() {
		return dao;
	}

	public Connection getConnection() {
		// 1.JNDL 서버 객체 생성
		InitialContext ic;
		Connection conn = null;
		try {
			ic = new InitialContext();
			// 2.Lookup()
			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			// 3.getConnection()
			conn = ds.getConnection();

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			conn.close();
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			conn.close();
			stmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void close(Connection conn, PreparedStatement pstmt) {
		try {
			conn.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Product> Home(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		List<Product> list = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement("select * from product where continent='Asia' ");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int indexNo = rs.getInt("indexNo");
				String proName = rs.getString("proName");
				String text = rs.getString("text");
				Product product = new Product(indexNo, proName, text);
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(conn, pstmt, rs);
		return list;
	}
	public ArrayList<Cart> Reservation(String userId) throws NamingException{
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Cart> res = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM orders WHERE userId = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Cart cart = new Cart(rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getString(6));
				res.add(cart);
			}
			
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		close(conn, pstmt, rs);
		return res;
	}
	
	
	

	public Cart selectAir(String indexNo, int num, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		Cart cart = new Cart();
		try {
			pstmt = conn.prepareStatement("select * from Air where indexNo=?");
			pstmt.setString(1, indexNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String[] tempBoardingDate = rs.getString(5).split(" ");
				String[] tempDepartureDate = rs.getString(6).split(" ");
				String proName = rs.getString(3) + "-" + rs.getString(4);
				String date = tempBoardingDate[1] + tempBoardingDate[2] + " " + tempBoardingDate[3];
				String option = tempBoardingDate[0] + "-" + tempDepartureDate[0] + " / ";
				option += rs.getString(7) + " / ";
				option += num + "명";
				int price = rs.getInt(8) * num;

				cart = new Cart(proName, date, option, price, type);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		close(conn, pstmt, rs);
		return cart;
	}

	public Cart selectHotel(String indexNo, int num, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		Cart cart = new Cart();
		try {
			pstmt = conn.prepareStatement("select * from Hotel where indexNo=?");
			pstmt.setString(1, indexNo);
			rs = pstmt.executeQuery();
			String date = null;

			if (rs.next()) {
				String proName = rs.getString(3) + "(" + rs.getString(7) + " " + rs.getString(8) + ")";
				String option = rs.getString(4) + " / ";
				option += "CHECK IN : " + rs.getString(5) + " ";
				option += "CHECK OUT : " + rs.getString(6) + " / ";
				option += num + "명";
				int price = rs.getInt(9) * num;

				cart = new Cart(proName, date, option, price, type);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		close(conn, pstmt, rs);
		return cart;
	}

	public ArrayList<Air> selectAllAir() {
		ArrayList<Air> airList = new ArrayList<Air>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();

		try {
			pstmt = conn.prepareStatement("select * from Air");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int indexNo = rs.getInt(1);
				String imgurl = rs.getString(2);
				String toair = rs.getString(3);
				String formair = rs.getString(4);
				String boardingTime = rs.getString(5);
				String departureTime = rs.getString(6);
				String classAir = rs.getString(7);

				int price = rs.getInt(8);
				airList.add(new Air(indexNo, imgurl, toair, formair, boardingTime, departureTime, classAir, price));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		close(conn, pstmt, rs);
		return airList;
	}

	public ArrayList<Hotel> selectAllHotel() {

		ArrayList<Hotel> hotelList = new ArrayList<Hotel>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();

		try {
			pstmt = conn.prepareStatement("select * from Hotel");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int indexNo = rs.getInt(1);
				String imgurl = rs.getString(2);
				String name = rs.getString(3);
				String classHotel = rs.getString(4);
				String checkin = rs.getString(5);
				String checkout = rs.getString(6);
				String nation = rs.getString(7);
				String address = rs.getString(8);
				int price = rs.getInt(9);
				hotelList.add(new Hotel(indexNo, imgurl, name, classHotel, checkin, checkout, nation, address, price));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt, rs);
		return hotelList;
	}

	public Product selectProduct(int indexNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		Product pro = new Product();
		try {
			pstmt = conn.prepareStatement("select * from product where indexNo=?");
			pstmt.setInt(1, indexNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String proName = rs.getString(2);
				int price = rs.getInt(3);
				String address = rs.getString(6);
				String date = rs.getString(7);
				String tel = rs.getString(8);
				String text = rs.getString(9);
				String detailtext = rs.getString(10);
				String hashTag = rs.getString(11);
				String mapurl = rs.getString(12);
				String img_root = rs.getString(13);
				String option = rs.getString(14);

				pro = new Product(indexNo, proName, price, address, date, tel, text, detailtext, hashTag, mapurl,
						img_root, option);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		close(conn, pstmt, rs);
		return pro;
	}

	public int insertOrder(String userId, Cart cart) {
		PreparedStatement pstmt = null;
		Connection conn = getConnection();
		int count = 0;
		try {
			pstmt = conn.prepareStatement("insert into orders value(?,?,?,?,?,?)");
			pstmt.setString(1, userId);
			pstmt.setString(2, cart.getProName());
			pstmt.setString(3, cart.getDate());
			pstmt.setString(4, cart.getOption());
			pstmt.setInt(5, cart.getPrice());
			pstmt.setString(6, cart.getContent());
			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt);
		return count;
	}

	public int deleteUser(String userId) {
		PreparedStatement pstmt = null;
		Connection conn = getConnection();
		int count = 0;
		try {
			pstmt = conn.prepareStatement("delete from userInfo where userId = ?");
			pstmt.setString(1, userId);
			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt);
		return count;
	}

	public int insertUser(UserInfo user) {
		PreparedStatement pstmt = null;
		Connection conn = getConnection();
		int count = 0;
		try {
			pstmt = conn.prepareStatement(
					"insert into userInfo (name ,userId,userPwd,Email,phoneNo,address) values(?,?,?,?,?,?)");
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getUserId());
			pstmt.setString(3, user.getUserPwd());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPhoneNo());
			pstmt.setString(6, user.getAddress());
			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt);
		return count;
	}

	public boolean selectUser(String userId, String userPwd) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean result = false;
		try {
			pstmt = conn.prepareStatement("select userId, userPwd from userInfo where userId = ? and userPwd = ?");
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt, rs);
		return result;
	}
	
	public int updateUser(UserInfo user) {
		PreparedStatement pstmt = null;
		Connection conn = getConnection();
		int count = 0;
		try {
			pstmt = conn.prepareStatement(
					"update userInfo set name=?,userPwd=? ,email=? ,phoneNo=? ,address=? where userId=?");
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getUserPwd());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhoneNo());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getUserId());
			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt);
		return count;
	}
	
	public ArrayList<Product> selectAllProduct(){
		ArrayList<Product> al = new ArrayList<Product>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();

		try {
			pstmt = conn.prepareStatement("select * from Product");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				al.add(new Product(
						rs.getInt(1) ,
						rs.getString(2), 
						rs.getInt(3), 
						rs.getString(4),
						rs.getString(5),
						rs.getString(6), 
						rs.getString(7), 
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt, rs);
		return al;
	}

	public int countList(String continent){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		int count = 0;
		try {
			pstmt = conn.prepareStatement("select count(*) from Product where continent=?");
			pstmt.setString(1, continent);
			rs=  pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt);
		return count;
	}
	
	
	public ArrayList<Product> continentSearch(String continent) throws SQLException{
		
		ArrayList<Product> al = new ArrayList<Product>();
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		stmt = conn.createStatement();
		String sql = null;
		System.out.print("나오니");
		try {
		
			sql = String.format("select * from Product where continent = '%s' ", continent);
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				al.add(new Product(
						rs.getInt(1) ,
						rs.getString(2), 
						rs.getInt(3), 
						rs.getString(4),
						rs.getString(5),
						rs.getString(6), 
						rs.getString(7), 
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(conn, stmt, rs);
		return al;
		
	}
	public ArrayList<Product> continentSearchOther(String continent) throws SQLException{
		
		ArrayList<Product> al = new ArrayList<Product>();
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		stmt = conn.createStatement();
		String sql = null;
		try {
		
			sql = String.format("select * from Product where continent != '%s' ", continent);
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				al.add(new Product(
						rs.getInt(1) ,
						rs.getString(2), 
						rs.getInt(3), 
						rs.getString(4),
						rs.getString(5),
						rs.getString(6), 
						rs.getString(7), 
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, stmt, rs);
		return al;
	}
	public ArrayList<Product> detailSearchAll(String text) throws SQLException{
		
		ArrayList<Product> al = new ArrayList<Product>();
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		stmt = conn.createStatement();
		String sql = null;
		try {
			sql = String.format("select * from Product where  (nation like '%%%s%%' or proName like '%%%s%%' or text like '%%%s%%' or detailtext like '%%%s%%' )",text,text,text,text);
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				al.add(new Product(
						rs.getInt(1) ,
						rs.getString(2), 
						rs.getInt(3), 
						rs.getString(4),
						rs.getString(5),
						rs.getString(6), 
						rs.getString(7), 
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, stmt, rs);
		return al;
	}
	public ArrayList<Product> detailSearch(String parm , String text) throws SQLException{
		
		ArrayList<Product> al = new ArrayList<Product>();
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		stmt = conn.createStatement();
		String sql = null;
		try {
			sql = String.format("select * from Product where continent = '%s' and (nation like '%%%s%%' or proName like '%%%s%%' or text like '%%%s%%' or detailtext like '%%%s%%' )",parm,text,text,text,text);
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				al.add(new Product(
						rs.getInt(1) ,
						rs.getString(2), 
						rs.getInt(3), 
						rs.getString(4),
						rs.getString(5),
						rs.getString(6), 
						rs.getString(7), 
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, stmt, rs);
		return al;
	}
	
	public int deleteProduct(int indexNo) {
		PreparedStatement pstmt = null;
		Connection conn = getConnection();
		int count = 0;
		try {
			pstmt = conn.prepareStatement("delete from Product where indexNo = ?");
			pstmt.setInt(1, indexNo);
			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt);
		return count;
	}

	public int deleteAir(int indexNo) {
		PreparedStatement pstmt = null;
		Connection conn = getConnection();
		int count = 0;
		try {
			pstmt = conn.prepareStatement("delete from Air where indexNo = ?");
			pstmt.setInt(1, indexNo);
			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt);
		return count;
	}

	public int deleteHotel(int indexNo) {
		PreparedStatement pstmt = null;
		Connection conn = getConnection();
		int count = 0;
		try {
			pstmt = conn.prepareStatement("delete from Hotel where indexNo = ?");
			pstmt.setInt(1, indexNo);
			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt);
		return count;
	}
	
	public int insertProduct(Product pro) {
		PreparedStatement pstmt = null;
		Connection conn = getConnection();
		int count = 0;
		try {
			pstmt = conn.prepareStatement(
					"insert into product (proName ,price,continent,nation,address,date,tel,text,detailtext,hashTag,mapurl,img_root,options) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, pro.getProName());
			pstmt.setInt(2, pro.getPrice());
			pstmt.setString(3, pro.getContinent());
			pstmt.setString(4, pro.getNation());
			pstmt.setString(5, pro.getAddress());
			pstmt.setString(6, pro.getDate());
			pstmt.setString(7, pro.getTel());
			pstmt.setString(8, pro.getText());
			pstmt.setString(9, pro.getDetailtext());
			pstmt.setString(10, pro.getHashTag());
			pstmt.setString(11, pro.getMapurl());
			pstmt.setString(12, pro.getImg_root());
			pstmt.setString(13, pro.getOption());
			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt);
		return count;
	}

	public int insertAir(Air air) {
		PreparedStatement pstmt = null;
		Connection conn = getConnection();
		int count = 0;
		try {
			pstmt = conn.prepareStatement(
					"insert into Air(imgurl ,toair, formair, boardingTime, DEPARTURETIME, class, price) values(?,?,?,?,?,?,?)");
			pstmt.setString(1, air.getImgurl());
			pstmt.setString(2, air.getToair());
			pstmt.setString(3, air.getFormair());
			pstmt.setString(4, air.getBoardingTime());
			pstmt.setString(5, air.getDepartureTime());
			pstmt.setString(6, air.getClassAir());
			pstmt.setInt(7, air.getPrice());

			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt);
		return count;
	}

	public int insertHotel(Hotel hotel) {
		PreparedStatement pstmt = null;
		Connection conn = getConnection();
		int count = 0;
		try {
			pstmt = conn.prepareStatement(
					"insert into Hotel(imgurl ,name, class, checkin, checkout, nation, address, price) values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, hotel.getImgurl());
			pstmt.setString(2, hotel.getName());
			pstmt.setString(3, hotel.getClassHotel());
			pstmt.setString(4, hotel.getCheckin());
			pstmt.setString(5, hotel.getCheckout());
			pstmt.setString(6, hotel.getNation());
			pstmt.setString(7, hotel.getAddress());
			pstmt.setInt(8, hotel.getPrice());

			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(conn, pstmt);
		return count;
	}
	
}
