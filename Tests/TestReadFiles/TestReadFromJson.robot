*** Settings ***
Resource    ../../UtilitiesKeywords/JsonTestDataReader.robot

Suite Setup    Setup

*** Variables ***
${jsonFilePath}=    Resources/testJsonFile.json

*** Test Cases ***
Read From Json File Example
    Log To Console    Hello, my name is ${testData["firstname"]} ${testData["lastname"]}

    ${firstname}=    JSON Test Data    ${testData["firstname"]}
    ${lastname}=     JSON Test Data    ${testData["lastname"]}
    Log To Console    Hello, my name is: ${firstname} ${lastname}

*** Keywords ***
Setup
    ${testData}=    Load Test Data JSON File    Resources/testJsonFile.json
    Set Suite Variable    ${testData}