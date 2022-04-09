*** Variables ***
#Browser
${browserType}    chromium
${headless}       False

#Google
${googleBaseUrl}    https://www.google.com/ncr

#PHPTRAVELS
${phptravelsAdminBaseUrl}    https://phptravels.net/api/admin
${phptravelsEmail}           admin@phptravels.com
${phptravelsPassword}        demoadmin

#*** Keywords ***
#Set Browser Variables
#    Set Global Variable    ${browser}    chromium
