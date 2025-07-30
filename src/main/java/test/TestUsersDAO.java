package test;

import dao.UsersDAO;
import model.Users;
import java.util.ArrayList;

public class TestUsersDAO {
    public static void main(String[] args) {
        UsersDAO usersDAO = new UsersDAO();
        ArrayList<Users> userList = usersDAO.selectAll();

        for (Users user : userList) {
            System.out.println("User ID: " + user.getUsersID());
            System.out.println("Fullname: " + user.getFullname());
            System.out.println("Username: " + user.getUsername());
            System.out.println("Email: " + user.getEmail());
            System.out.println("Role: " + user.getRole().getRoleID());
            System.out.println("Created At: " + user.getCreate_at());
            System.out.println("Status: " + (user.isStatus() ? "Active" : "Inactive"));
            System.out.println("---------------------------");
        }
    }
}
