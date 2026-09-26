*** Settings ***
Library  SeleniumLibrary

# importer le fichier keywordLogin dans le fichier Test_cas
# si le fichier Test etait dans le repertoire Test>Test.robot on aura : ../Ressources/KeywordLogin.robot
Resource  Ressources/KeywordLogin.robot
# NB on place variable en bas ou en haut de test case mais pas dans la rubrique test case ( la rubrique
# test case comprend le nom du projet et les instructions du cas de test.
Default Tags  Test_Login

*** Variables ***
#variable scalaire
${URL}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
# liste
@{credentials}  Admin  admin123
# type dictionaire

# Variable dictionnaire user et mot de passe corrects
&{login}  user=Admin  passwd=admin123

# Variable dictionnaire mot de passe incorrect
&{loginPsswdInc}  user=Admin  passwd=admin123TTTSET

# Variable dictionnaire user incorrect
&{loginUserInc}  user=AdminRERR  passwd=admin123

# Variable dictionnaire user et mot de passe incorrects
&{loginPsswdUserInc}  user=AdminDESRG  passwd=admin123TTTSET



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
   [Tags]  AUTHENTICATION AVEC IDENTIFIANT CORRECT
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
   [Tags]  AUTHENTICATION AVEC MOT DE PASSE INCORRECT
   open browser  ${URL}  firefox
   Maximize browser Window
   Wait Until Element Is Visible  xpath=//form    10s
   LOGIN MDP INC
   click button  xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

   # Doit attendre avant
   Set Browser Implicit Wait   20s
   Close Browser


TC3
   [Tags]  AUTHENTICATION AVEC L INFORMATION UTILISATEUR INCORRECT
   open browser  ${URL}  firefox
   Maximize browser Window
   Wait Until Element Is Visible  xpath=//form    10s

   # issu du keywork utilisateur incorrect
   LOGIN USER INC
   click button  xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

   # Doit attendre avant
   Set Browser Implicit Wait   20s
   Close Browser

TC4
   [Tags]  AUTHENTICATION AVEC LES INFORMATIONS UTILISATEUR ET MOT DE PASSE INCORRECT
   open browser  ${URL}  firefox
   Maximize browser Window
   Wait Until Element Is Visible  xpath=//form    10s

   # issu du keywork utilisateur et mot de passe incorrect
   LOGIN USER MDP INC
   click button  xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

   # Doit attendre avant
   Set Browser Implicit Wait   20s
   Close Browser

TC5
   [Tags]  TC5
   open browser  ${URL}  firefox
   Maximize browser Window
   Wait Until Element Is Visible  xpath=//form    10s

   # NB avant roboframework 3.5 pour acceder a une liste on faisait @{credentials}[0] , maintenant on fait ${credentials}[0]
   Input Text    xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input   ${login}[user]
   Input Password  Name=password   ${login}[passwd]
   click button  xpath=/html/body/div/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

   # Doit attendre avant
   Set Browser Implicit Wait   20s


# pour executer le TC specifique depuis la ligne de commande il faut faire
# robot -t nom_cas_de_test  dossier\nom de fichier de test ex : robot -t TC3 testProject\Test_cases.robot
# pour 2 cas de test ex : robot -t TC1 -t TC2 testProject\Test_cases.robot
# pour executer le fichier , on fait : robot testProject\Test_cases.robot
# Pour le standard robotframework : on cree les dossiers Librairie , Ressources( pour les declaration de variable) , Tests ( pour les cas de test a la racine du projet)
# Pour le test pour mettre les resultats dans le dossier test : robot -d Resultats TestProjet\Test_case_login.robot
# si on est dans le projet TestProjet , on fais : robot -d Resultats Test_case_login.robot