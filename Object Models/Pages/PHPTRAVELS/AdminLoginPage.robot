*** Settings ***
Library    Browser

Resource    ../../../Resources/GlobalVariables.robot

*** Variables ***
${url}    ${phptravelsAdminBaseUrl}

${email_textField}                xpath=//input[@name='email' and @type='text']
${password_textField}             xpath=//input[@name='password']
${login_button}                   xpath=//button[contains(.,'Login')]
${errorMessageHoldOn_text}        xpath=//div[@class='resultlogin' and contains(.,'Hold On...')]
${errorMessage_text}              xpath=//div[@class='resultlogin' and contains(.,'Invalid')]

*** Keywords ***
Navigate To Admin Login Page
    New Page       ${url}

Admin User Login
    [Arguments]    ${email}    ${password}
    Type Text    ${email_textField}        ${email}    
    Type Text    ${password_textField}     ${password}
    Click        ${login_button}

Assert On Login Error Message
    [Arguments]    ${expectedErrorMessage}
    Wait For Elements State    ${errorMessageHoldOn_text}   hidden 
    Get Text    ${errorMessage_text}  ==  ${expectedErrorMessage}
    ${errorMessageText}=     Get Text    ${errorMessage_text}
    Should Be Equal    ${errorMessageText}    ${expectedErrorMessage}
