*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${booking_serviceName}    /booking

*** Keywords ***
Create Booking
    [Arguments]    ${firstName}    ${lastName}    ${totalPrice}    ${depositPaid}    ${bookingDates_checkin}    ${bookingDates_checkout}    ${additionalNeeds}
    ${bookingDatesBody}=    Create Dictionary    checkin=${bookingDates_checkin}    checkout=${bookingDates_checkout}
    ${jsonBody}=    Create Dictionary    firstname=${firstName}    lastname=${lastName}    totalprice=${totalPrice}    depositpaid=${depositPaid}    bookingdates=${bookingDatesBody}    additionalneeds=${additionalNeeds}
    ${response}=    POST On Session    ${booking_serviceName}
    [Return]    ${response}

Get Booking Id
    [Arguments]    ${firstName}    ${lastName}
    ${queryparams}=    firstname=${firstName}    lastname=${lastName}
    ${response}=    GET On Session    restfulBooker    ${booking_serviceName}    params=${queryparams}
    ${bookingId}=    Get Value From Json    ${response.json()}    $.bookingid
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