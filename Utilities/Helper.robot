*** Settings ***
Library    DateTime

*** Keywords ***
Get Current Time Formatted
    [Documentation]    Full date to be used in generating unique test data preparation result_format=%Y%m%d%H%M%S
    ${currentTime}=    Get Current Date    result_format=%Y%m%d%H%M%S    #%f
    Set Suite Variable    ${currentTime}

Get Current Time Formatted Mobile
    [Documentation]    To be used in generating unique mobile numbers cases    result_format=%d%H%M%S
    ${currentDateMobile}=    Get Current Date    result_format=%d%H%M%S
    Set Suite Variable    ${currentDateMobile}