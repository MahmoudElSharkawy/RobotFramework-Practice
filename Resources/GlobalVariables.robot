*** Variables ***
###########################################
## Execution 
###########################################

#Browser
#chromium, chrome, msedge, firefox or webkit(safari)
${browserType}    chromium
${headless}       False

#Window resolution
${width}     1920
${height}    1080

#Timeouts
${browserTimeout}   60s

###########################################
## Environment 
###########################################
#Google
${googleBaseUrl}    https://www.google.com/ncr

#PHPTRAVELS
${phptravelsAdminBaseUrl}    https://phptravels.net/api/admin
${phptravelsEmail}           admin@phptravels.com
${phptravelsPassword}        demoadmin

#*** Keywords ***
#Set Browser Variables
#    Set Global Variable    ${browser}    chromium