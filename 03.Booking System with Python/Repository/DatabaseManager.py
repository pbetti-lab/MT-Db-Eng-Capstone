import sys 
sys.path.append("Configurations\\")

from ConfigurationManager import DatabaseJsonConfiguration

class DatabaseConfiguration:    
    def __init__(self) -> None:  
        databaseJsonConfiguration = DatabaseJsonConfiguration() 
        jsonConfiguration = databaseJsonConfiguration.Get()
        self.__initFields__(jsonConfiguration)

    @property
    def Host(self) -> str:
        return self.__host__

    @property
    def Port(self) -> str:
        return self.__port__

    @property
    def UserName(self) -> str:
        return self.__userName__

    @property
    def Password(self) -> str:
        return self.__password__

    @property
    def Database(self) -> str:
        return self.__database__

    def __initFields__(self, jsonConfiguration) -> None:
        self.__host__ = ""
        self.__port__ = ""
        self.__userName__ = ""
        self.__password__ = ""
        self.__database__ = ""

        if len(jsonConfiguration) > 0:
            self.__host__ = jsonConfiguration["host"]
            self.__port__ = jsonConfiguration["port"]
            self.__userName__ = jsonConfiguration["userName"]
            self.__password__ = jsonConfiguration["password"]
            self.__database__ = jsonConfiguration["database"]


