### Lists the `aws-cli` commands that can be used for querying from the Database

### the DB will be created at the topmost-level of the project folder

# assuming that user has gone through
# https://github.com/kaushikthedeveloper/dynamodb-local#using-the-aws-cli-with-downloadable-dynamodb

### Base of the commands :
aws dynamodb

### prefixed by :
--endpoint-url http://localhost:8000

# list all the tables with the associated with the endpoint
# https://docs.aws.amazon.com/cli/latest/reference/dynamodb/list-tables.html
aws dynamodb list-tables --endpoint-url http://localhost:8000

# describe the structure of the table queried
# https://docs.aws.amazon.com/cli/latest/reference/dynamodb/describe-table.html
aws dynamodb describe-table --table-name <table_name> --endpoint-url http://localhost:8000