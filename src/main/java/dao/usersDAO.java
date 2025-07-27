package dao;

import model.Users;
import model.Role;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class usersDAO implements DAOInterface<Users>{

	@Override
	public ArrayList<Users> selectAll() {
		ArrayList<Users> result = new ArrayList<Users>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM users";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String usersID = rs.getString(1);
				String roleID = rs.getString(2);
				String fullname = rs.getString(3);
				String username = rs.getString(4);
				String password = rs.getString(5);
				String email = rs.getString(6);
				Date create_at = rs.getDate(7);
				Boolean status = rs.getBoolean(8);
				Role role = new Role();
				role.setRoleID(roleID);
				Users users = new Users(usersID, role, fullname, username, password, email, create_at, status);
				result.add(users);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Users selectById(Users t) {
		 Users users = null;
		    try {
		        Connection con = JDBCUtil.getConnection();
		        String sql = "SELECT * FROM users WHERE usersID = ?";
		        PreparedStatement st = con.prepareStatement(sql);
		        st.setString(1, t.getUsersID());
		        ResultSet rs = st.executeQuery();
		        if (rs.next()) {
		            String usersID = rs.getString(1);
		            String roleID = rs.getString(2);
		            String fullname = rs.getString(3);
		            String username = rs.getString(4);
		            String password = rs.getString(5);
		            String email = rs.getString(6);
		            Date create_at = rs.getDate(7);
		            Boolean status = rs.getBoolean(8);

		            Role role = new Role();
		            role.setRoleID(roleID);

		            users = new Users(usersID, role, fullname, username, password, email, create_at, status);
		        }
		        con.close();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return users;
	}

	@Override
	public int insert(Users t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO users (usersID, roleID, fullname, username, password, email, create_at, status) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getUsersID());
			st.setString(2, t.getRole().getRoleID());
			st.setString(3, t.getFullname());
			st.setString(4, t.getUsername());
			st.setString(5, t.getPassword());
			st.setString(6, t.getEmail());
			st.setDate(7, t.getCreate_at());
			st.setBoolean(8, t.isStatus());
			result = st.executeUpdate();
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Have " + result + " changed");
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int insertAll(ArrayList<Users> arr) {
		int totalInserted = 0;
	    try {
	        Connection con = JDBCUtil.getConnection();
	        String sql = "INSERT INTO users (usersID, roleID, fullname, username, password, email, create_at, status) "
	                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        PreparedStatement st = con.prepareStatement(sql);

	        for (Users t : arr) {
	            st.setString(1, t.getUsersID());
	            st.setString(2, t.getRole().getRoleID());
	            st.setString(3, t.getFullname());
	            st.setString(4, t.getUsername());
	            st.setString(5, t.getPassword());
	            st.setString(6, t.getEmail());
	            st.setDate(7, t.getCreate_at());
	            st.setBoolean(8, t.isStatus());

	            totalInserted += st.executeUpdate();
	        }
	        System.out.println("Đã thêm tổng cộng: " + totalInserted + " user(s).");
	        JDBCUtil.closeConnection(con);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return totalInserted;
	}

	@Override
	public int delete(Users t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE FROM users WHERE usersID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getUsersID());
			System.out.println(sql);
			result = st.executeUpdate();
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Have " + result + " changed");
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int deleteAll(ArrayList<Users> arr) {
		int count = 0;
		for (Users user : arr) {
			count += this.delete(user);
		}
		return count;
	}

	@Override
	public int update(Users t) {
		int result = 0;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE users SET roleID=?, fullname=?, username=?, password=?, email=?, create_at=?, status=? "
					+ "WHERE usersID=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getRole().getRoleID());
			st.setString(2, t.getFullname());
			st.setString(3, t.getUsername());
			st.setString(4, t.getPassword());
			st.setString(5, t.getEmail());
			st.setDate(6, t.getCreate_at());
			st.setBoolean(7, t.isStatus());
			st.setString(8, t.getUsersID());
			System.out.println(sql);
			result = st.executeUpdate();
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Have " + result + " changed");
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
