*** Settings ***
Library    RequestsLibrary

Resource    ../../../Resources/Configurations/Environments.resource

*** Variables ***
${createAccount_serviceName}    /api/createAccount

*** Keywords ***
Api Create/Register User Account
    [Arguments]    ${name}    ${email}    ${password}
    ${data}=    Create Dictionary    name=${name}    
                              ...    email=${email}
                              ...    password=${password}
                              ...    title=Mr
                              ...    birth_date=04
                              ...    birth_month=09
                              ...    birth_year=1994
                              ...    firstname=Mahmoud
                              ...    lastname=ElSharkawy
                              ...    company=VOIS
                              ...    address1=Cairo
                              ...    address2=Obour
                              ...    country=India
                              ...    zipcode=20100
                              ...    state=Cairo
                              ...    city=Obour
                              ...    mobile_number=01155150745
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded

    ${response}=    POST    ${automationExerciseBaseUrl}${createAccount_serviceName}    headers=${headers}    data=${data}
    [Return]    ${response}