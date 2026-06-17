package farmbd;

import java.sql.*;
import java.util.Scanner;

public class CropService {
    private static final Scanner sc = new Scanner(System.in);

    public static void addCrop(Seller seller){
        System.out.println("Crop Name: ");
        String name = sc.nextLine();
        System.out.println("Type (Rice, Wheat, Vegetable etc): ");
        String type = sc.nextLine();
        System.out.println("Quantity: ");
        double qty = sc.nextDouble();
        System.out.println("Price per unit: ");
        double price = sc.nextDouble();
        sc.nextLine();

        String sql = "INSERT INTO crops (name, type, quantity, price_per_unit, seller_id) VALUES (?, ?, ?, ?, ?)";

        try(Connection conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, name);
            pstmt.setString(2, type);
            pstmt.setDouble(3, qty);
            pstmt.setDouble(4, price);
            pstmt.setInt(5, seller.getId());
            pstmt.executeUpdate();

            System.out.println("Crop added successfully for sale!");
        }
        catch (SQLException e){
            System.out.println("Error: " + e.getMessage());
        }
    }

    public static void viewMyCrops(Seller seller){
        String sql = "SELECT * FROM crops WHERE seller_id = ?";
        try(Connection conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(1, seller.getId());
            ResultSet rs = pstmt.executeQuery();

            System.out.println("\n--- My Crops ---");
            boolean found = false;
            while (rs.next()){
                System.out.println("ID:" + rs.getInt("id") + " | " +  rs.getString("name") +
                        " | Qty:" + rs.getDouble("quantity") + " | Price:" + rs.getDouble("price_per_unit") +
                        " | Status:" + rs.getString("status"));
                found = true;
            }
            if (!found) System.out.println("No crops found.");
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void viewAvailableCrops() {
        String sql = "SELECT c.id, c.name, c.type, c.quantity, c.price_per_unit, u.full_name " +
                "FROM crops c JOIN users u ON c.seller_id = u.id " +
                "WHERE c.status = 'AVAILABLE' ORDER BY c.id DESC";

        try(Connection conn = DBConnection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            System.out.println("\n=== Available Crops in Market ===\n");
            boolean hasCrops = false;

            while (rs.next()) {
                hasCrops = true;
                System.out.println("ID            : " + rs.getInt("id"));
                System.out.println("Crop          : " + rs.getString("name"));
                System.out.println("Type          : " + rs.getString("type"));
                System.out.println("Quantity      : " + rs.getDouble("quantity"));
                System.out.println("Price/Unit    : Tk " + rs.getDouble("price_per_unit"));
                System.out.println("Seller        : " + rs.getString("full_name"));
                System.out.println("----------------------------------");
            }

            if(!hasCrops){
                System.out.println("No crops available at the moment.");
            }
        }
        catch (SQLException e){
            System.out.println("Database Error: " + e.getMessage());
        }
    }

    public static void buyCrop(Buyer buyer){
        System.out.println("Enter Crop ID to buy: ");
        int cropId = sc.nextInt();
        System.out.println("Enter quantity: ");
        double qty = sc.nextDouble();
        sc.nextLine();

        String sql = "UPDATE crops SET status = 'SOLD' WHERE id = ? AND status = 'AVAILABLE'";
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setInt(1, cropId);
            int rows = pstmt.executeUpdate();

            if (rows > 0){
                System.out.println("Purchase Successful! Thanks you for buying.");
            }
            else {
                System.out.println("Crop not available or already sold.");
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }
}
