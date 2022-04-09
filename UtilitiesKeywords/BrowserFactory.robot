*** Settings ***
Library    Browser

Resource    ../Resources/GlobalVariables.robot

*** Keywords ***
Open New Browser
    New Browser    ${browserType}    ${headless}
    Set Browser Timeout    60s