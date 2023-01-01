*** Settings ***
Library    Browser

Resource    ../../../Resources/Configurations/Environments.resource

*** Variables ***
${url}    ${googleBaseUrl}

${searchBat_textField}    xpath=//*[@name='q']
# ${firstSearchResult_h3}   xpath=(//h3[contains(@class,'LC20lb')])[1]

*** Keywords ***
## Locators getters
Get Search Option Locator
    [Arguments]    ${index}
    ${locator}    Set Variable    xpath=(//h3[contains(@class,'LC20lb')])[${index}]
    [return]    ${locator} 
    
*** Keywords ***
## Actions
Navigate To Google Home Page
    New Page       ${url}

Google Search
    [Arguments]    ${query}
    Type Text    ${searchBat_textField}    ${query}
    Keyboard Key    press    Enter 

*** Keywords ***
## Validations
Assert On Search Result Text
    [Arguments]   ${index}    ${ExpectedText}
    ${searchResultLocator}=    Get Search Option Locator    1
    Get Text    ${searchResultLocator}    ==    ${ExpectedText}
