*** Settings ***
Library    Browser

Resource    ../../UtilitiesKeywords/BrowserFactory.robot
Resource    ../../Pages/Google/GooglePage.robot

Suite Setup    Setup
Suite Teardown    Close Browser

*** Variables ***

*** Test Cases ***
Google Search Test 1
    [Documentation]    Google Search for Robot Framework Browser Library and check the first search result
    [Tags]    testcaseid    bugid    Smoke    Regression    Positive
    Google Search    Robot Framework Browser Library
    Assert On First Search Result Text    Robot Framework Browser library
    
Google Search Test 2
    [Documentation]    Google Search for Robot Framework SeleniumLibrary and check the first search result
    [Tags]    testcaseid    bugid    Smoke    Regression    Positive
    Google Search    Robot Framework SeleniumLibrary
    Assert On First Search Result Text    SeleniumLibrary - Robot Framework

*** Keywords ***
Setup
    Open New Browser
    Navigate To Google Home Page
