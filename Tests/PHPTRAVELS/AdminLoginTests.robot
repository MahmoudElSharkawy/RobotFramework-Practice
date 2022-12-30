*** Settings ***
Library    Browser

Resource    ../../Utilities/BrowserFactory.robot
Resource    ../../Object Models/Pages/PHPTRAVELS/AdminLoginPage.robot
Resource    ../../Object Models/Pages/PHPTRAVELS/DashboardPage.robot

Test Setup    Setup
Test Teardown    Close Browser

*** Variables ***

*** Test Cases ***
Test Valid Admin User Login
    [Documentation]    Login with valid Admin user credentials and check that the user is navigated to the Dashboard page
    [Tags]    testcaseid    bugid    Smoke    Regression    Positive
    Admin User Login    ${phptravelsEmail}    ${phptravelsPassword}
    Assert On Dashboard Header Text    Dashboard

Test Invalid Admin User Login With Wrong Credentials
    [Documentation]    Login with invalid Admin user credentials and check the error message
    [Tags]    testcaseid    bugid    Smoke    Regression    Negative
    Admin User Login    test@email.com    testpassword
    Assert On Login Error Message    Invalid Login Credentials

*** Keywords ***
Setup
    Initialize New Browser
    Navigate To Admin Login Page