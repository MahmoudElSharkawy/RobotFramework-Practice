*** Settings ***                                                                                       
Library    Collections                                                                                 
Library    RequestsLibrary                                                                             
Library    JSONLibrary
Library    OperatingSystem
                                                                                                       
Suite Setup    Create Session  jsonplaceholder  https://jsonplaceholder.typicode.com                   
                                                                                                       
*** Test Cases ***                                                                                                    
Get Request Test
    #${response}=    GET On Session  jsonplaceholder  /posts/1
    #Dictionary Should Contain Value     ${response.json()}  sunt aut facere repellat provident  
    ${getPostsResponse}=    Get Posts    1
    Assert That Response Contains Value    ${getPostsResponse.text}    sunt aut facere repellat provident

Quick Get A JSON Body Test
    #${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
    ${getPostsResponse}=    Get Posts    1
    Should Be Equal As Strings    1  ${getPostsResponse.json()}[id]

Post Request Test                                                                                      
    #&{data}=    Create dictionary  title=Robotframework requests  body=This is a test!  userId=1       
    #${response}=    POST On Session    jsonplaceholder  /posts  json=${data}  expected_status=anything
    ${createPostResponse}=    Create Post    Robotframework requests    This is a test!    1                                                                                             
    Status Should Be    201    ${createPostResponse}  

Test List
    ${response}=    GET On Session    jsonplaceholder    /todos
    ${completedValueList}=    Get Value From Json    ${response.json()}    $[?(@.completed==true)].completed
    FOR    ${value}    IN    @{completedValueList}
        Log    ${value}
        Run Keyword And Continue On Failure    Should Be Equal As Strings    ${value}    True
    END

*** Keywords ***
Get Posts
    [Arguments]    ${id}    
    ${response}=    GET On Session  jsonplaceholder  /posts/${id}
    [return]    ${response}

Create Post    
    [Arguments]    ${title}    ${body}    ${userId}                                                                                    
    &{data}=    Create dictionary    title=${title}    body=${body}    userId=${userId}       
    ${response}=    POST On Session    jsonplaceholder  /posts  json=${data}  expected_status=anything
    [Return]    ${response}

Assert That Response Contains Value    
    [Arguments]                   ${response}    ${expected}
    Should Contain                ${response}    ${expected}