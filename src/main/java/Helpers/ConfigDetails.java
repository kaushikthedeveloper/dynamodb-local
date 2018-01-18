package Helpers;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * ---Helper class---
 * Provide the data given in resources/config.properties
 */
public class ConfigDetails {

    // filepath
    private String f_config = "../config.properties";

    private String tableName;

    /**
     * Load the details from environment.properties
     */
    public ConfigDetails(){
        // set the Properties file
        Properties prop = new Properties();
        try {
            InputStream inputStream = this.getClass().getResourceAsStream(f_config);
            prop.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // get the properties
        tableName = prop.getProperty("tableName");
    }

    public String getTableName() {
        return tableName;
    }
}
