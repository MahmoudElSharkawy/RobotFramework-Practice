*** Settings ***
Library    Browser

Resource    ../../../Resources/GlobalVariables.robot

*** Variables ***
${url}    ${googleBaseUrl}

${searchBat_textField}    xpath=//*[@name='q']
${firstSearchResult_h3}   xpath=(//h3[contains(@class,'LC20lb')])[1]

*** Keywords ***
Navigate To Google Home Page
    New Page       ${url}

Google Search
    [Arguments]    ${query}
    Type Text    ${searchBat_textField}    ${query}
    Keyboard Key    press    Enter 

Assert On First Search Result Text
    [Arguments]   ${ExpectedText}
    Get Text    ${firstSearchResult_h3}    ==    ${ExpectedText}
