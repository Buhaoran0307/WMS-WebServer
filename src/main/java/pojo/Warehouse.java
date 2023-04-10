package pojo;

public class Warehouse {
    private Integer warehouseID;
    private String warehouseName;
    private int capacity;
    private int remaining;
    private String location;
    private Integer administratorID;

    private Warehouse(){}

    public Warehouse(int capacity,int remaining,int administratorID){
        this.setCapacity(capacity);
        this.setRemaining(remaining);
        this.setAdministratorID(administratorID);
    }

    public Integer getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(Integer warehouseID) {
        this.warehouseID = warehouseID;
    }

    public String getWarehouseName() {
        return warehouseName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getRemaining() {
        return remaining;
    }

    public void setRemaining(int remaining) {
        this.remaining = remaining;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Integer getAdministratorID() {
        return administratorID;
    }

    public void setAdministratorID(Integer administratorID) {
        this.administratorID = administratorID;
    }

    @Override
    public String toString() {
        return "Warehouse{" +
                "warehouseID=" + warehouseID +
                ", warehouseName='" + warehouseName + '\'' +
                ", capacity=" + capacity +
                ", remaining=" + remaining +
                ", location='" + location + '\'' +
                ", administratorID=" + administratorID +
                '}';
    }
}
