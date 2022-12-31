*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

Resource    ../../../Resources/Configurations/Environments.resource

*** Variables ***
${login_serviceName}    /auth

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    ## Get the access token
    ${jsonBody}=    Create dictionary    username=${username}    password=${password} 
    ${authHeaders}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST    ${restfulBookerBaseUrl}${login_serviceName}    headers=${authHeaders}    json=${jsonBody}
    ${accessToken}=    Set Variable    ${response.json()}[token]
    # ${accessToken}=    Get Value From Json    ${response.json()}    $.token
    # ${accessToken}=    ${accessToken}[0]
    
    ## Set the access token as a session header to be set automatically with all the coming requests using the same alias (restfulBooker)
    ${headers}=    Create dictionary    Content-Type=application/json    Authorization=Basic ${accessToken}    #Cookie=token=${accessToken}
    Create Session    restfulBooker   ${restfulBookerBaseUrl}    headers=${headers}