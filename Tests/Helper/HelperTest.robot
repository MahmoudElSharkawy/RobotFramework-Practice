*** Settings ***
Library    ../../UtilitiesKeywords/Helper.py

*** Test Cases ***
Test
    ${date}=    Get Current Date  
    Log To Console    The current date is: ${date}