package farmbd;

import java.time.LocalDate;
import java.time.LocalTime;

public class Crop {
    private int id;
    private String name;
    private String type;
    private double quantity;
    private double pricePerUnit;
    private int sellerId;
    private String status;
    private LocalDate postedDate;

    public Crop(String name, String type, double quantity, double pricePerUnit, int sellerId){
        this.name = name;
        this.type = type;
        this.quantity = quantity;
        this.pricePerUnit = pricePerUnit;
        this.sellerId = sellerId;
        this.status = "AVAILABLE";
        this.postedDate = LocalDate.now();
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public String getType() { return type; }
    public double getQuantity() { return quantity; }
    public double getPricePerUnit() { return pricePerUnit; }
    public int gwtSellerId() { return sellerId; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    @Override
    public String toString() {
        return String.format("ID:%d | %s (%s) | Qty: %.1f | Price: Tk %.2f | Status: %s", id, name, type, quantity, pricePerUnit, status);
    }
}