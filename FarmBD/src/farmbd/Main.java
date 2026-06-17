package farmbd;

import java.sql.*;
import java.util.Scanner;

public class Main {
    public static User currentUser = null;
    public static final Scanner sc = new Scanner(System.in);

    public static void main (String[] args){
        System.out.println("Welcome to FarmBD - Farm Business Management System");


        while (true){
            if (currentUser == null){
                loginMenu();
            }
            else{
                currentUser.showMenu();
                int choice = sc.nextInt();
                sc.nextLine();
                currentUser.performAction(choice);
            }
        }
    }

    private static void loginMenu() {
        System.out.println("\n=== LOGIN MENU ===");
        System.out.println("1. Login");
        System.out.println("2. Register");
        System.out.println("3. Exit");
        System.out.println("Choose: ");
        int choice = sc.nextInt();
        sc.nextLine();

        if (choice == 1) login();
        else if (choice == 2) register();
        else if (choice == 3) System.exit(0);
    }

    private static void login() {
        System.out.println("Username: ");
        String username = sc.nextLine();
        System.out.println("Password: ");
        String password = sc.nextLine();

        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()){
                String role = rs.getString("role");
                if (role.equals("SELLER")){
                    currentUser = new Seller(rs.getInt("id"), username, rs.getString("full_name"));
                }
                else {
                    currentUser = new Buyer(rs.getInt("id"), username, rs.getString("full_name"));
                }
            }
            else {
                System.out.println("Invalid credentials!");
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void register(){
        System.out.println("Full Name: ");
        String name =sc.nextLine();
        System.out.println("Username: ");
        String username = sc.nextLine();
        System.out.println("Password: ");
        String pass = sc.nextLine();
        System.out.println("Role (SELLER/BUYER): ");
        String role = sc.nextLine().toUpperCase();

        String sql = "INSERT INTO users (username, password, role, full_name) VALUES (?, ?, ?, ?)";
        try(Connection conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, username);;
            pstmt.setString(2, pass);
            pstmt.setString(3, role);
            pstmt.setString(4, name);
            pstmt.executeUpdate();
            System.out.println("Registration Successful! Now login.");
        }
        catch (SQLException e){
            System.out.println("Username already exists!");
        }
    }
}
