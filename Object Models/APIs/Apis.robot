*** Comments ***
This class have all the common keywords that will be used in Tests and/or Object Models files

*** Keywords ***
Validate That Response Body Contains Value    
    [Arguments]    ${response}    ${expectedValue}
    Should Contain    ${response.text}    ${expectedValue}