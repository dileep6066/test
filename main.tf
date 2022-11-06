# this is your Terraform Snowflake provider
terraform {
    required_providers {
        snowflake = {
            source  = "Snowflake-Labs/snowflake"
            version = "0.39.0"
        }
    }
}

# connect to your Snowflake account
provider "snowflake" {
    account = var.sfaccount
    region = "us-east-2" 
    username = var.sfusername
    password = var.sfpassword
    role = "accountadmin"
}

# create one "my_tf_database.my_tf_schema.my_tf_table" db table
resource "snowflake_database" "my_tf_database1" {
  name      = "my_tf_database1"
}
resource "snowflake_schema" "my_tf_schema" {
  database  = snowflake_database.my_tf_database1.name
  name      = "my_tf_schema"
}
resource "snowflake_table" "my_tf_table" {
  database  = snowflake_database.my_tf_database1.name
  schema    = snowflake_schema.my_tf_schema.name
  name      = "my_tf_table"
column {
    name     = "id"
    type     = "int"
  }
  column {
    name     = "data"
    type     = "text"
  }
  column {
    name     = "data2"
    type     = "text"
  }
}  
resource "snowflake_table" "my_tf_table2" {
  database  = snowflake_database.my_tf_database1.name
  schema    = snowflake_schema.my_tf_schema.name
  name      = "my_tf_table2"
column {
    name     = "id"
    type     = "int"
  }
  column {
    name     = "data"
    type     = "text"
  }
  column {
    name     = "data2"
    type     = "text"
  }
  column {
    name     = "data3"
    type     = "text"
  }
}
