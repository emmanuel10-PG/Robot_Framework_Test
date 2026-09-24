*** settings ***
library  SeleniumLibrary
# il y a deux espaces entre la syntaxe et l'information ex clic button (deux espaces) id=rttt
*** Test Cases ***
 ## projet de test
 # pour executer le test sur python on tape la commande : robot (nom du fichier a executer)
 # pour executer directement dans l'editeur en appuyant sur run , on fait run -> edit configuration -> on va
 # (suite) sur python puis on appuis + et on met le Name (expl : robot) puis dans script path on met le chemin de robot framework
 # pour ouvrir un texte precis : robot --test "Open Google" test.robot
 # pour changer de dossier : robot --outputdir results test.robot
*** test cases ***
TestProjet
   Log  hello world

TC1
   [tags]  TC1
   open browser  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login  firefox
   Maximize browser Window
   # Doit attendre avant de creer
   Wait Until Element Is Visible    xpath=//form    10s
   Input Text  xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input  Admin
   input Password   Name=password  admin123
   click button  xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

#TC1
#   [tags]  TC1
#   open browser  https://www.google.com  firefox
#   Maximize browser Window
#   click button  xpath=//*[@id="L2AGLb"]
#   # input text  xpath=//*[@id="ti6dpd"]  Roboframework oubien input text   id=ti6dpd  Roboframework test
#   input text   id=ti6dpd  Roboframework test


# automatisation d un formulaire d authentifcation
