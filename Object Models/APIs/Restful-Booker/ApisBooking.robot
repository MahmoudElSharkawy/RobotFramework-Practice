*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Resource    ../Apis.robot

*** Variables ***
${booking_serviceName}    /booking

*** Keywords ***
Create Booking
    [Arguments]    ${firstName}    ${lastName}    ${totalPrice}    ${depositPaid}    ${bookingDates_checkin}    ${bookingDates_checkout}    ${additionalNeeds}
    ${bookingDatesBody}=    Create Dictionary    checkin=${bookingDates_checkin}    checkout=${bookingDates_checkout}
    ${jsonBody}=    Create Dictionary    firstname=${firstName}    lastname=${lastName}    totalprice=${totalPrice}    depositpaid=${depositPaid}    bookingdates=${bookingDatesBody}    additionalneeds=${additionalNeeds}
    ${response}=    POST On Session    restfulBooker    ${booking_serviceName}    json=${jsonBody}
    [Return]    ${response}

Get Booking Ids
    [Arguments]    ${firstName}    ${lastName}
    ${queryParams}=    Create Dictionary    firstname=${firstName}    lastname=${lastName}
    ${response}=    GET On Session    restfulBooker    ${booking_serviceName}    params=${queryParams}
    [Return]    ${response}

Get Booking Id
    [Arguments]    ${firstName}    ${lastName}
    ${response}=    Get Booking Ids    ${firstName}    ${lastName}
    ${bookingId}=    Get Value From Json    ${response.json()}    $[0].bookingid
    [Return]    ${bookingId}[0]

Get Booking
    [Arguments]    ${firstName}    ${lastName}
    ${bookingId}=    Get Booking Id    ${firstName}    ${lastName}
    ${response}=    GET On Session    restfulBooker    ${booking_serviceName}/${bookingId}
    [Return]    ${response}

Delete Booking
    [Arguments]    ${firstName}    ${lastName}
    ${bookingId}=    Get Booking Id    ${firstName}    ${lastName}
    ${response}=    Delete On Session    restfulBooker    ${booking_serviceName}/${bookingId}
    [Return]    ${response}


############# Validations ############
Validate That The Booking is Created
    [Arguments]    ${expectedFirstName}    ${expectedLastName}
    ${response}=    Get Booking    ${expectedFirstName}    ${expectedLastName}
    ${fn}=    Get Value From Json    ${response.json()}    $.firstname
    ${ln}=    Get Value From Json    ${response.json()}    $.lastname
    Run Keyword And Continue On Failure    Should Be Equal    ${fn}[0]    ${expectedFirstName}
    Run Keyword And Continue On Failure    Should Be Equal    ${ln}[0]    ${expectedLastName}

Validate That Booking Does not Exist
    [Arguments]    ${firstName}    ${lastName}
    ${response}=    Get Booking Ids    ${firstName}    ${lastName}
    Validate That Response Body Contains Value    ${response}    []