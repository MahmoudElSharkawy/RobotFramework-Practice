*** Settings ***
Library    Browser

Resource    ../../Utilities/BrowserFactory.robot
Resource    ../../Object Models/Pages/Google/GooglePage.robot

Suite Setup    Setup
Suite Teardown    Close Browser

*** Variables ***

*** Test Cases ***
Google Search Test 1
    [Documentation]    Google Search for Robot Framework Browser Library and check the first search result
    [Tags]    testcaseid    bugid    Smoke    Regression    Positive
    Google Search    Robot Framework Browser Library
    Assert On Search Result Text    1    Browser Library
    
Google Search Test 2
    [Documentation]    Google Search for Robot Framework SeleniumLibrary and check the first search result
    [Tags]    testcaseid    bugid    Smoke    Regression    Positive
    Google Search    Robot Framework SeleniumLibrary
    Assert On Search Result Text    1    SeleniumLibrary - Robot Framework

*** Keywords ***
Setup
    Initialize New Browser
    Navigate To Google Home Page
