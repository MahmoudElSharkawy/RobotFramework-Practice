*** Settings ***
Resource    ../../Object Models/APIs/Restful-Booker/ApisBooking.robot
Resource    ../../Object Models/APIs/Restful-Booker/ApisUserManagement.robot
Resource    ../../Utilities/Helper.robot
Resource    ../../Object Models/APIs/Apis.robot

Suite Setup    Setup

*** Test Cases ***
Test Create Booking
    Create Booking    Mahmoud_Create${currentTime}    ElSharkawy    1000000    true    2023-01-01    2024-01-01    Cream Caramel
    Validate That The Booking is Created    Mahmoud_Create${currentTime}    ElSharkawy

Test Delete Booking
    [Setup]    Create Booking    Mahmoud_Delete${currentTime}    ElSharkawy    1000000    true    2023-01-01    2024-01-01    Cream Caramel
    ${deleteResponse}=    Delete Booking    Mahmoud_Delete${currentTime}    ElSharkawy
    Validate That Response Body Contains Value    ${deleteResponse}    Created
    Validate That Booking Does not Exist    Mahmoud_Delete${currentTime}    ElSharkawy

*** Keywords ***
Setup
    Get Current Time Formatted
    Admin User Login