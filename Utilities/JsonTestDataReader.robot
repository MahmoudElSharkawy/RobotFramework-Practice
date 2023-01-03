*** Settings ***
Library    JSONLibrary

*** Keywords ***
Load Test Data JSON File
    [Documentation]     
    ...    **Use it like this in the Suite Setup keyword:**
    ...    #Load Test Data JSON File    testJsonFile.json
    ...
    ...    **Then use it like this in a Test Case:**
    ...    #Log To Console    Hello, my name is: ${testData["firstname"]} ${testData["lastname"]}
    ...
    ...   **Or use it like this to store test data in a variable:**
    ...    #Set Test Variable    ${firstname}    ${testData["firstname"]}
    ...    #Set Test Variable    ${lastname}    ${testData["lastname"]}
    ...    #Log To Console    Hello, my name is: ${firstname} ${lastname}
    ...
    ...    **We can get a value in an object tree like this:**
    ...    #Log To Console    Hello, my name is: ${testData["user"]["firstname"]} ${testData["user"]["lastname"]}
    [Arguments]    ${jsonFilePath}
    # ${testData}  Evaluate  json.load(open("Resources/TestDataFiles/JSONs/${jsonFilePath}", encoding="utf8"))    json
    ${testData}=    Load Json From File    ${EXECDIR}/Resources/TestDataFiles/JSONs/${jsonFilePath}    encoding=UTF-8
    Set Suite Variable    ${testData}