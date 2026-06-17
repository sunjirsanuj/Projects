package farmbd;

public class Buyer extends User {
    public Buyer(int id, String username, String fullName) {
        super(id, username, fullName);
    }

    @Override
    public void showMenu(){
        System.out.println("\n=== BUYER PORTAL - " + getFullName() + " ===");
        System.out.println("1. View Available Crops");
        System.out.println("2. Buy Crop");
        System.out.println("3. Logout");
        System.out.println("Choose option: ");
    }

    @Override
    public void performAction(int choice){
        switch (choice){
            case 1 -> CropService.viewAvailableCrops();
            case 2 -> CropService.buyCrop(this);
            case 3 -> Main.currentUser = null;
            default -> System.out.println("Invalid choice!");
        }
    }
}
