*** Settings ***
Library   SeleniumLibrary

# important il faut toujours importer les library

*** Keywords ***
LOGINKWD
   Input Text    xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input   ${credentials}[0]
   Input Password  Name=password   ${credentials}[1]

LOGIN MDP INC
   Input Text    xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input   ${loginPsswdInc}[user]
   Input Password  Name=password  ${loginPsswdInc}[passwd]

LOGIN USER INC
   Input Text    xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input   ${loginUserInc}[user]
   Input Password  Name=password  ${loginUserInc}[passwd]

Fermer le navigateur
    Close Browser

LOGIN USER MDP INC
   Input Text    xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input   ${loginPsswdUserInc}[user]
   Input Password  Name=password  ${loginPsswdUserInc}[passwd]

