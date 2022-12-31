*** Comments ***
This class have all the common keywords that will be used in Tests and/or Object Models files

*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

Resource    ../../../Resources/Configurations/Environments.resource

*** Variables ***
${login_serviceName}    /auth

*** Keywords ***
User Login
    [Arguments]    ${username}    ${password}
    ## Get the access token
    ${jsonBody}=    Create dictionary    username=${username}    password=${password} 
    ${authHeaders}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST    ${restfulBookerBaseUrl}${login_serviceName}    headers=${authHeaders}    json=${jsonBody}
    ${accessToken}=    Set Variable    ${response.json()}[token]
    # ${accessToken}=    Get Value From Json    ${response.json()}    $.token
    # ${accessToken}=    ${accessToken}[0]
    
    ## Set the access token as a session header to be set automatically with all the coming requests using the same alias (restfulBooker)
    ${headers}=    Create dictionary    Content-Type=application/json    Cookie=token=${accessToken}    #Authorization=Basic ${accessToken}
    Create Session    restfulBooker   ${restfulBookerBaseUrl}    headers=${headers}

Admin User Login
    User Login    ${restfulBookerUsername}    ${restfulBookerPassword}

Validate That Response Body Contains Value    
    [Arguments]    ${response}    ${expectedValue}
    Should Contain    ${response.text}    ${expectedValue}