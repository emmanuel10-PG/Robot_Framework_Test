*** Settings ***
Library  SeleniumLibrary

# NB on place variable en bas ou en haut de test case mais pas dans la rubrique test case ( la rubrique
# test case comprend le nom du projet et les instructions du cas de test.

*** Variables ***
#variable scalaire
${URL}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
# liste
@{credentials}  Admin  admin123
# type dictionaire
&{login}  user=Admin  passwd=admin123


# il y a deux espaces entre la syntaxe et l'information ex clic button (au moins deux espaces) id=rttt

 ## projet de test
 # pour executer le test sur python on tape la commande : robot (nom du fichier a executer)
 # pour executer directement dans l'editeur en appuyant sur run , on fait run -> edit configuration -> on va
 # (suite) sur python puis on appuis + et on met le Name (expl : robot) puis dans script path on met le chemin de robot framework
 # pour ouvrir un texte precis : robot --test "Open Google" test.robot
 # pour changer de dossier : robot --outputdir results test.robot
*** Test Cases ***
TestProjet
   Log  Test roboframework

TC1
   [Tags]  TC1
   open browser  ${URL}  firefox
   Maximize browser Window
   Wait Until Element Is Visible  xpath=//form    10s
    LOGINKWD
   # NB avant roboframework 3.5 pour acceder a une liste on faisait @{credentials}[0] , maintenant on fait ${credentials}[0]
    click button  xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

   # Doit attendre avant
   Set Browser Implicit Wait   20s
   Close Browser

TC2
   [Tags]  TC2
   open browser  ${URL}  firefox
   Maximize browser Window
   Wait Until Element Is Visible  xpath=//form    10s

   # NB avant roboframework 3.5 pour acceder a une liste on faisait @{credentials}[0] , maintenant on fait ${credentials}[0]
   Input Text    xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input   ${login}[user]
   Input Password  Name=password   ${login}[passwd]
   click button  xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

   # Doit attendre avant
   Set Browser Implicit Wait   20s


*** Keywords ***
LOGINKWD
   Input Text    xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input   ${credentials}[0]
   Input Password  Name=password   ${credentials}[1]
# automatisation d un formulaire d authentifcation
