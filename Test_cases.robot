*** Settings ***
Library  SeleniumLibrary

# NB on place variable en bas ou en haut de test case mais pas dans la rubrique test case ( la rubrique
# test case comprend le nom du projet et les instructions du cas de test.

*** Variables ***
#variable scalaire
${URL}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login


# il y a deux espaces entre la syntaxe et l'information ex clic button (au moins deux espaces) id=rttt

 ## projet de test
 # pour executer le test sur python on tape la commande : robot (nom du fichier a executer)
 # pour executer directement dans l'editeur en appuyant sur run , on fait run -> edit configuration -> on va
 # (suite) sur python puis on appuis + et on met le Name (expl : robot) puis dans script path on met le chemin de robot framework
 # pour ouvrir un texte precis : robot --test "Open Google" test.robot
 # pour changer de dossier : robot --outputdir results test.robot
*** Test Cases ***
TestProjet
   Log  hello world


TC1
   [Tags]  TC1
   open browser  ${URL}  firefox
   Maximize browser Window
   Wait Until Element Is Visible  xpath=//form    10s
   Input Text    xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input  Admin
   Input Password  Name=password  admin123
   click button  xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

   # Doit attendre avant de creer
   #Set Browser Implicit Wait   10s
   close browser


TC2
   [Tags]  TC2
   open browser  https://www.google.com  firefox
   Maximize browser Window
   # click button  xpath=//*[@id="L2AGLb"]
   Set Browser Implicit Wait  5s
   # input text  xpath=//*[@id="ti6dpd"]  Roboframework oubien input text   id=ti6dpd  Roboframework test
   input text   id=ti6dpd  Roboframework test


