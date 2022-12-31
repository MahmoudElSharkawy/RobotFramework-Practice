*** Settings ***
Library    Browser

Resource    ../Resources/GlobalVariables.resource

*** Keywords ***
Initialize New Browser
    New Browser    ${browserType}    ${headless}

    IF    '${browserType}' == 'chrome' or '${browserType}' == 'msedge'
        New Browser    chromium    headless=${headless}    channel=${browserType}
    ELSE
        New Browser    ${browserType}    headless=${headless}
    END

    New Context    viewport={'width': ${width}, 'height': ${height}}    recordVideo={'dir': '${SUITE NAME}', 'size':{'width':1920, 'height':1080}}

    Set Browser Timeout    ${browserTimeout}

    # New Page    ${baseUrl}