*** Settings ***
Library    Browser

Resource    ../../../Resources/Configurations/Environments.resource

*** Variables ***
${url}    ${automationExerciseBaseUrl}/login

# Elements locators
${loginEmail_input}        xpath=//input[@data-qa='login-email']
${loginPassword_input}     xpath=//input[@data-qa='login-password']
${login_button}            xpath=//button[@data-qa='login-button']

*** Keywords ***
Navigate to Login Page
    New Page    ${url}

Login
    [Arguments]    ${email}    ${password}
    Type Text    ${loginEmail_input}    ${email}
    Type Secret    ${loginPassword_input}    ${password}
    Click    ${login_button}