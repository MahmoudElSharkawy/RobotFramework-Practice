*** Settings ***
Resource    ../../Utilities/JsonTestDataReader.robot

Suite Setup    Load Test Data JSON File    ${jsonFilePath}

*** Variables ***
${jsonFilePath}=    Resources/testJsonFile.json

*** Test Cases ***
Read From Json File Example
    Set Test Variable    ${firstname}    ${testData["user"]["firstname"]}
    Set Test Variable    ${lastname}    ${testData["user"]["lastname"]}
    Log To Console    Hello, my name is: ${firstname} ${lastname}

Read From Json File Example 2
    Log To Console    Hello, my name is: ${testData["user"]["firstname"]} ${testData["user"]["lastname"]}