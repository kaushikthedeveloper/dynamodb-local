### Lists the `aws-cli` commands that can be used for querying from the Database
### Used and confirmed Basic examples

# assuming that user has gone through beforehand
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

# create table
# https://docs.aws.amazon.com/cli/latest/reference/dynamodb/create-table.html
aws dynamodb create-table \
    --table-name <table_name> \
    --attribute-definitions \
        AttributeName=<attr_name_1>,AttributeType=<attr_type_1> \
        AttributeName=<attr_name_2>,AttributeType=<attr_type_2> \
    --key-schema \
        AttributeName=<attr_name_1>,KeyType=HASH \
        AttributeName=<attr_name_2>,KeyType=RANGE \
    --provisioned-throughput \
        ReadCapacityUnits=<read_capacity>,WriteCapacityUnits=<write_capacity> \
    --endpoint-url http://localhost:8000

# delete table
# https://docs.aws.amazon.com/cli/latest/reference/dynamodb/delete-table.html
aws dynamodb delete-table --table-name <table_name> --endpoint-url http://localhost:8000