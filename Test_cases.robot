*** settings ***
library  SeleniumLibrary
# il y a deux espaces entre la syntaxe et l'information ex clic button (deux espaces) id=rttt
*** Test Cases ***
 ## projet de test
Log  hello world

TC1
   [tags]  TC1
   open browser  https://www.google.com  firefox
   Maximize browser Window
   click button  id=L2AGLb