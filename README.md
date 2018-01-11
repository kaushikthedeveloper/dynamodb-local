# DynamoDB Local project using Java

***(does not require aws account)***

This project focuses on providing a complementary project, showcasing working with locally setup DynamoDB.

Recommended to first go through : [DynamoDB Developer Guide](
https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Introduction.html)

## Steps to Recreate the project (from scratch)

### Start the local DynamoDB server manually [<sup> [1] </sup>](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html)

1. Download the [DynamoDB local JAR file](
http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.DynamoDBLocal.html)
2. Extract the `tar.gz` file :

    ```bash
    $ tar xvzf <dynamodb file>
    ```
    
3. In the CLI, go to the directory where the files were extracted, and execute the following command:

    ```bash
    $ java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb
    ```

    **NOTE : This starts a local database with server running at the default** `port:8000` **.**

    #### Options available for starting DynamoDB [<sup> [1] </sup>](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html)

    - cors value — Enables support for cross-origin resource sharing (CORS) for JavaScript.
    
    - dbPath value — The directory where DynamoDB writes its database file.
    
    - delayTransientStatuses — Causes DynamoDB to introduce delays for certain operations.
    
    - help — Prints a usage summary and options.
    
    - inMemory — DynamoDB runs in memory instead of using a database file.
    
    - optimizeDbBeforeStartup — Optimizes the underlying database tables before starting DynamoDB on your computer.
    
    - port value — The port number that DynamoDB uses to communicate with your application.


### Set the credentials for AWS [<sup> [2] </sup>](https://stackoverflow.com/a/48187594/7550472)

4. [Setup some dummy credentials](https://docs.aws.amazon.com/sdk-for-net/v2/developer-guide/net-dg-config-creds.html)
 (*required as otherwise throws Error : **Unable to load AWS credentials from any provider
 in the chain***). The simplest method :
 
    - Open the default config file : ~/aws/credentials
    - Change the values in it to anything (like empty string here)
      
      ```text
      [default]
      aws_access_key_id=''
      aws_secret_access_key=''
      ```

### Create the Java project [<sup> [3] </sup>](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GettingStarted.Java.html)

5. Create a Maven project.

6.  Add the [DynamoDB Maven repository](
https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html) to your application's 
Project Object Model (POM) file:
   
       ```xml
       <!--Dependency:-->
       <dependencies>
           <dependency>
              <groupId>com.amazonaws</groupId>
              <artifactId>DynamoDBLocal</artifactId>
              <version>[1.11,2.0)</version>
           </dependency>
       </dependencies>
       <!--Custom repository:-->
       <repositories>
           <repository>
              <id>dynamodb-local-oregon</id>
              <name>DynamoDB Local Release Repository</name>
              <url>https://s3-us-west-2.amazonaws.com/dynamodb-local/release</url>
           </repository>
       </repositories>
       ```
       
       **NOTE : choose the appropriate region-wise url for the repository (depending on the region for the downloaded
        DynamoDB)**

7. Proceed with the Java programs.

***NOTE : when run, the programs creates the local DataBase in the topmost project folder.***

## Using the AWS CLI with Downloadable DynamoDB

A preferable way to access and query your DB that is created is to use the `aws cli`. Install it in the terminal :

```bash
$ sudo apt install awscli 
```

The AWS CLI can interact with DynamoDB (Downloadable Version) that runs on your computer. To enable this, add the 
following parameter to **each command**:
```bash
--endpoint-url http://localhost:8000
```

Here is an *example* that uses the AWS CLI to list the tables in a local database:

```bash
$ aws dynamodb list-tables --endpoint-url http://localhost:8000
```

If DynamoDB is using a port number other than the default (8000), modify the --endpoint-url value accordingly.

For further reading on various `aws dynamodb` commands, go through :
[cli-aws-dynamodb](https://docs.aws.amazon.com/cli/latest/reference/dynamodb/index.html#cli-aws-dynamodb)


# References (further reading) :

1. [https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html](
https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html)
2. [https://stackoverflow.com/a/48187594/7550472](
https://stackoverflow.com/a/48187594/7550472)
3. [https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GettingStarted.Java.html](
https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GettingStarted.Java.html)


##### DISCLAIMER : Note : this is not affiliated with Amazon Web Services (AWS) in any way other than for reference purposes.