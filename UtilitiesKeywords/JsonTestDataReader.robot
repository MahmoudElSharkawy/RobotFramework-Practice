*** Keywords ***
Set JSON File Path    ${jsonFilePath}
    Set Global Variable    ${jsonFilePath}    ${jsonFilePath}

Load Test Data JSON File
    [Arguments]    ${jsonFilePath}
    ${jsonFileContent}  Evaluate  json.load(open("${jsonFilePath}", "r"))    json
    [Return]    ${jsonFileContent}

JSON Test Data
    [Arguments]    ${jsonObjectAndPath}
    Set Global Variable    ${testData_gv}    ${jsonObjectAndPath}
    [Return]    ${testData_gv}

## Use it like this in the Suite Setup keyword
#    ${testData}=    Load Test Data JSON File    Resources/testJsonFile.json
#    Set Suite Variable    ${testData}
## Then use it like this in a Test Case
#    Log To Console    Hello, my name is: ${testData["firstname"]} ${testData["lastname"]}
## Or user it like this to store test data in a variable
#    ${firstname}=    JSON Test Data    ${testData["firstname"]}
#    ${lastname}=     JSON Test Data    ${testData["lastname"]}
#    Log To Console    Hello, my name is: ${firstname} ${lastname}