package pojo;

import java.util.Date;

public class Goods {
    private Integer goodsID;
    private String name;
    private Date dateIn;
    private Date dateOut;
    private String colour;
    private String type;
    private String location;
    private Integer warehouseID;
    public Goods(String name, Date dateIn, String colour, String type, String location, Integer warehouseID){
        this.setName(name);
        this.setDateIn(dateIn);
        this.setColour(colour);
        this.setType(type);
        this.setLocation(location);
        this.setWarehouseID(warehouseID);
    }

    //给SQL用的
    public Goods(){}

    public Integer getGoodsID() {
        return goodsID;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDateIn() {
        return dateIn;
    }

    public void setDateIn(Date dateIn) {
        this.dateIn = dateIn;
    }

    public Date getDateOut() {
        return dateOut;
    }

    public void setDateOut(Date dateOut) {
        this.dateOut = dateOut;
    }

    public String getColour() {
        return colour;
    }

    public void setColour(String colour) {
        this.colour = colour;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Integer getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(Integer warehouseID) {
        this.warehouseID = warehouseID;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodID=" + goodsID +
                ", name='" + name + '\'' +
                ", dateIn=" + dateIn +
                ", dateOut=" + dateOut +
                ", colour='" + colour + '\'' +
                ", type='" + type + '\'' +
                ", location='" + location + '\'' +
                ", warehouseID=" + warehouseID +
                '}';
    }
}
