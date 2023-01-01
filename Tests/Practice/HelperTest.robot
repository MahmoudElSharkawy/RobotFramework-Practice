*** Settings ***
Library    ../../Utilities/Helper.py

*** Test Cases ***
Test Python Code into Robot Keyword
    ${date}=    Get Current Date  
    Log To Console    The current date is: ${date}