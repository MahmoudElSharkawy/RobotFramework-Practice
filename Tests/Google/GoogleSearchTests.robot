*** Settings ***
Library    Browser

Resource    ../../Utilities/BrowserFactory.robot
Resource    ../../Object Models/Pages/Google/GooglePage.robot
Resource    ../../Utilities/JsonTestDataReader.robot

Suite Setup    Setup
Suite Teardown    Close Browser

*** Variables ***

*** Test Cases ***
Google Search Test 1
    [Documentation]    Google Search for Robot Framework Browser Library and check the first search result
    [Tags]    testcaseid    bugid    Smoke    Regression    Positive
    Google Search    ${testData["searchQuery"]["browserLibrary"]}
    Assert On Search Result Text    ${testData["index"]}    ${testData["Expected"]["browserLibrary"]}
    
Google Search Test 2
    [Documentation]    Google Search for Robot Framework SeleniumLibrary and check the first search result
    [Tags]    testcaseid    bugid    Smoke    Regression    Positive
    Google Search    ${testData["searchQuery"]["seleniumLibrary"]}
    Assert On Search Result Text    ${testData["index"]}    ${testData["Expected"]["seleniumLibrary"]}

*** Keywords ***
Setup
    Load Test Data JSON File    GoogleSearchTestDataJsonFile.json
    Initialize New Browser
    Navigate To Google Home Page
