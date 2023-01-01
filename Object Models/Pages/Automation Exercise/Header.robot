*** Settings ***
Library    Browser

*** Variables ***
${userProfile_a}    xpath=//i[contains(@class,'fa-user')]//parent::a

*** Keywords ***
Validate That The User Is Logged In
    [Arguments]    ${expectedUserName}
    Get Text    ${userProfile_a}    ==     ${SPACE}Logged in as ${expectedUserName}