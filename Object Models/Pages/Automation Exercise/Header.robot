*** Settings ***
Library    Browser

*** Variables ***
${userProfile_a}    xpath=//i[contains(@class,'fa-user')]//parent::a

*** Keywords ***
Validate That The User Is Logged In
    [Arguments]    ${expectedUserFirstname}
    Get Text    ${userProfile_a}    ==     ${SPACE}Logged in as ${expectedUserFirstname}