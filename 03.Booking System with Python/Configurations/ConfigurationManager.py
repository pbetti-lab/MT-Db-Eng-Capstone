import json
import sys

class DatabaseJsonConfiguration:    
    __filePath__ = "Configurations\DatabaseConfiguration.json"

    def __init__(self) -> None:  
        pass

    def Get(self):
        try:
            with open(self.__filePath__, "r") as configFile:
                return json.loads(configFile.read())
        except FileNotFoundError:
            print("File at '{0}' doesn't exist".format(self.__filePath__))
            return json.loads("{}")
        except:
            print("Unexpected error: {0} - {1}".format(sys.exc_info()[0], sys.exc_info()[1]))
            return json.loads("{}")
