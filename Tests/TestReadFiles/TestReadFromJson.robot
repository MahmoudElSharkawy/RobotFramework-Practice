*** Settings ***
Library    OperatingSystem

*** Variables ***
${jsonFilePath}=    Resources/testJsonFile.json

*** Test Cases ***
Read From Json File Example
    #${jsonFile}=    Get file    ${jsonFilePath}
    #${object}=    Evaluate    json.loads('''${jsonFile}''')    json
    ${object}  Evaluate  json.load(open("${jsonFilePath}", "r"))    json

    Log To Console    Hello, my name is ${object["firstname"]} ${object["lastname"]}