*** Settings ***
Library    Browser

*** Variables ***
${pageTitle_h1}    xpath=//h1[@class='display-4 mb-0']

*** Keywords ***
Assert On Dashboard Header Text
    [Arguments]   ${ExpectedText}
    Get Text    ${pageTitle_h1}    ==    ${ExpectedText}