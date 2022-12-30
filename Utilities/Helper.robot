*** Settings ***
Library    DateTime

*** Keywords ***
Get Current Date Formatted
    [Documentation]    Full date to be used in generating unique test data preparation result_format=%Y%m%d%H%M%S
    ${currentDate}=    Get Current Date    result_format=%Y%m%d%H%M%S    #%f
    Set Suite Variable    ${currentDate}

Get Current Date Formatted Mobile
    [Documentation]    To be used in generating unique mobile numbers cases    result_format=%d%H%M%S
    ${currentDateMobile}=    Get Current Date    result_format=%d%H%M%S
    Set Suite Variable    ${currentDateMobile}