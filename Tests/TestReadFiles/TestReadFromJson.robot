*** Settings ***
Library    JSONLibrary

Resource    ../../UtilitiesKeywords/JsonTestDataReader.robot

Suite Setup    Setup

*** Variables ***
${jsonFilePath}=    Resources/testJsonFile.json

*** Test Cases ***
Read From Json File Example
    Log To Console    Hello, my name is ${testData["firstname"]} ${testData["lastname"]}

    ${firstname}=    Get JSON Test Data    ${testData["firstname"]}
    ${lastname}=     Get JSON Test Data    ${testData["lastname"]}
    Log To Console    Hello, my name is: ${firstname} ${lastname}

Read From Json File Example 2
    Log To Console    Hello, my name is ${testData2["firstname"]} ${testData2["lastname"]}

    ${firstname2}=    Get Value From Json    ${testData2}    firstname
    ${lastname2}=    Get Value From Json    ${testData2}    lastname
    Log To Console    Hello, my name is: ${firstname2} ${lastname2}

*** Keywords ***
Setup
    ${testData}=    Load Test Data JSON File    ${jsonFilePath}
    Set Suite Variable    ${testData}
    ${testData2}=    Load JSON From File    ${jsonFilePath}
    Set Suite Variable    ${testData2}
