package DataException;

public abstract class WrongWarehouseInfException extends Exception{
    public int capacity;
    public int remaining;
    public int administratorID;

    public WrongWarehouseInfException(int capacity,int remaining,int administratorID){
        this.capacity = capacity;
        this.remaining = remaining;
        this.administratorID = administratorID;
    }
}
