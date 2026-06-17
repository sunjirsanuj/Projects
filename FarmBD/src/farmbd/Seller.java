package farmbd;

public class Seller extends User{
    public Seller(int id, String username, String fullName) {
        super(id, username, fullName);
    }

    @Override
    public void showMenu() {
        System.out.println("\n=== SELLER PORTAL - " + getFullName() + " ===");
        System.out.println("1. Add Crop for Sale");
        System.out.println("2. View My Crops");
        System.out.println("3. Logout");
        System.out.println("Choose option: ");
    }

    @Override
    public void performAction(int choice) {
        switch (choice) {
            case 1 -> CropService.addCrop(this);
            case 2 -> CropService.viewMyCrops(this);
            case 3 -> Main.currentUser = null;
            default -> System.out.println("Invalid coice!");
        }
    }
}
