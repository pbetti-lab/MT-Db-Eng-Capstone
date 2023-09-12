import sys
sys.path.append("Repository\\")

# import datetime as dt

from DatabaseManager import DatabaseConfiguration
from mysql import connector as connector

def PrintCustomeWhoSpendMoreThen(connection, spentValue):
    cursor = connection.cursor()
    
    query = """
        SELECT 
            c.FullName
            ,c.PhoneNumber
            ,c.Email
            ,od.Sales
        FROM OrderDetails od
            INNER JOIN Orders o
                ON o.Id = od.OrderId
            INNER JOIN Customers c
                ON c.Id = o.CustomerId
        WHERE od.Sales > {0};
    """.format(str(spentValue))

    cursor.execute(query)
    for row in cursor.fetchall(): 
        print("Name: {0} - Phone: {1} - Email: {2} - Sale: {3}".format(row[0], row[1], row[2], row[3]))

    cursor.close()

# note the configuration file is in: \Configurations\DatabaseConfiguration.json 
# set values according your local configuration

dbconf = DatabaseConfiguration()
connection = connector.Connect(
    host = dbconf.Host,
    port = dbconf.Port,
    user = dbconf.UserName, 
    password = dbconf.Password    
)

cursor = connection.cursor()
cursor.execute("USE " + dbconf.Database + ";")
cursor.close()

PrintCustomeWhoSpendMoreThen(connection, 60)

connection.close()
