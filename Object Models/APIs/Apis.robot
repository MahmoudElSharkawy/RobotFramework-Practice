*** Comments ***
This class have all the common keywords that will be used in Tests and/or Object Models files

*** Settings ***
Library    JSONLibrary

*** Keywords ***
Validate That Response Body Contains Value    
    [Arguments]    ${response}    ${expectedValue}
    Should Contain    ${response.text}    ${expectedValue}

Validate Response JSON Value
    [Arguments]    ${response}    ${jsonPath}    ${expectedValue}
    ${value}=    Get Value From Json    ${response.json()}    ${jsonPath}
    Should Be Equal As Strings    ${value}[0]    ${expectedValue}