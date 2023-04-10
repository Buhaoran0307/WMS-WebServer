import NetworkService.DataServerThread;

import java.io.IOException;

public class SetUpNetwork {
    public DataServerThread dataServerThread;

    public SetUpNetwork(){}

    public static void main(String[] args) throws IOException {
        SetUpNetwork setUpNetwork = new SetUpNetwork();

        setUpNetwork.initDataServer();
    }
    void initDataServer(){
        dataServerThread = new DataServerThread();
        dataServerThread.start();
    }
}
