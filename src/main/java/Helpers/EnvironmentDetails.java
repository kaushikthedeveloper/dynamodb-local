package Helpers;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * ---Helper class---
 * Provide the data given in resources/environment.properties
 */
public class EnvironmentDetails {

    // filepath
    private String f_environment = "../environment.properties";

    private String pathToDynamoDB;
    private String serviceEndPoint;
    private String signingRegion;
    private int portNumber;

    /**
     * Load the details from environment.properties
     * Initalise the class members
     */
    public EnvironmentDetails(){
        // set the Properties file
        Properties prop = new Properties();
        try {
            InputStream inputStream = this.getClass().getResourceAsStream(f_environment);
            prop.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // get the properties
        pathToDynamoDB = prop.getProperty("pathToDynamoDB");
        serviceEndPoint = prop.getProperty("serviceEndPoint");
        signingRegion = prop.getProperty("signingRegion");
        portNumber = Integer.parseInt( prop.getProperty("portNumber") );
    }

    public String getPathToDynamoDB() {
        return pathToDynamoDB;
    }

    public String getServiceEndPoint() {
        return serviceEndPoint;
    }

    public String getSigningRegion() {
        return signingRegion;
    }

    public int getPortNumber() {
        return portNumber;
    }
}
