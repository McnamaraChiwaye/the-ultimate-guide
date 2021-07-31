
# Tutorial first time setup

# how to import SQL information, to a dataframe, from MS SQL Server


# To get help on RODBC package use the RShowDoc command as follows

# RShowDoc (“RODBC”, package=”RODBC”)  print dicumentation

# MySQL RMySQL
# Oracle #ROracle
# JDBC
# ODBC connection -RODBC
# install.packages("RODBC")

library(RODBC)
library(DBI)


connection <-  odbcDriverConnect(
  "driver = {SQL Server}
  server = Your server name;
  database = Your database;
  trusted_conection = true;"
)

# Type everything as text in ""
# may need uid = account_ID and pwd = password
connection = odbcConnect("DESKTOP-U296KK3")

# This is the table i write from R to SQL server
data = read_csv("C:/Users/User/Documents/Python_Scripts/datacamp/Introduction to importing data in python/titanic.csv")

# ETL and append rows
# Write the table, is it doesn't exist it will be created
sqlSave(connection, data, tablename = "titanc", rownames =  FALSE, append = TRUE)
# append this data existing table in SQL server

odbcClose(connection)
# Dont forget to close your connection!

# Read data from sql
titanicfromsql <-  sqlQuery(connection, "select * from dbo.titanc")
basicDataTbl = sqlFetch(connection,"titanc")
