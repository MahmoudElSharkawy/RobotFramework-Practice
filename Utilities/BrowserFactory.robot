*** Settings ***
Library    Browser

Resource    ../Resources/GlobalVariables.robot

*** Keywords ***
Initialize New Browser
    New Browser    ${browserType}    ${headless}
    Set Browser Timeout    60s
    IF    '${browserType}' == 'chrome' or '${browserType}' == 'msedge'
        New Browser    chromium    headless=${headless}    channel=${browserType}
    ELSE
        New Browser    ${browserType}    headless=${headless}
    END

    New Context    viewport={'width': 1920, 'height': 1080}    recordVideo={'dir': '${SUITE NAME}', 'size':{'width':1920, 'height':1080}}

    Set Browser Timeout    60s

    # New Page    ${baseUrl}