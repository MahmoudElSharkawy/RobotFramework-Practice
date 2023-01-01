*** Settings ***
Resource    ../../Object Models/APIs/Automation Exercise/ApisUserManagement.robot
Resource    ../../Utilities/Helper.robot
Resource    ../../Utilities/BrowserFactory.robot
Resource    ../../Object Models/Pages/Automation Exercise/LoginPage.robot
Resource    ../../Object Models/Pages/Automation Exercise/Header.robot

Suite Setup    Setup

*** Test Cases ***
Login User with correct email and password
    [Setup]    Api Create/Register User Account    Mahmoud    test${currentTime}@test.com    12345678
    Login    test${currentTime}@test.com    12345678
    Validate That The User Is Logged In    Mahmoud

*** Keywords ***
Setup
    Get Current Time Formatted
    Initialize New Browser
    Navigate to Login Page