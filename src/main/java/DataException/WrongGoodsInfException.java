package DataException;

public abstract class WrongGoodsInfException extends Exception{
    public String name;
    public String colour;
    public int warehouseID;

    public WrongGoodsInfException(String name, String colour,int warehouseID){
        this.name = name;
        this.colour = colour;
        this.warehouseID = warehouseID;
    }
}
