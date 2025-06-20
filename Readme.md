
----- ESPAÑOL ------

PARA EJECUTAR EL SCRIPT BASTA CON HACER DOBLE CLICK EN EL ARCHIVO .BAT

- LUEGO DE EJECUTAR DEBES AUTENTICARTE CON LA CUENTA DE AZURE DONDE SE ENCUENTRAN LOS GRUPOS/USUARIOS QUE QUIERES EXTRAER.


-----------IMPORTANTE----------
HAY VARIOS SCRIPTS PARA CADA FUNCION ESPECIFICA:

- script-mail-type: se usa para extraer los usuarios activos cuyo mail termine en @tumaildepreferencia.com 
(para modificar el script, editalo con notepad++ y cambia @tumaildepreferencia.com por la direccio de mail que quieras filtrar).

- script-group-users: se usa para obtener todos los usuarios pertenecientes a los grupos de un tenant.


PARA EJECUTAR CON UN DOBLE CLICK DESDE EL ARCHIVO .bat SOLO DEBES EDITAR EL ARCHIVO "Get-AzureADGroupsorUsers"CON NOTEPAD++ 
Y EN LA SECCION DE "%~dp0script.ps1" CAMBIAS "script.ps1" por el script que quieras usar(ejemplo: "%~dp0script-group-users").


------------DISFRUTALO :)-----------------


------ ENGLISH -------

TO RUN THE SCRIPT, JUST DOUBLE-CLICK THE .BAT FILE.

- AFTER RUNNING, YOU MUST LOG IN WITH THE AZURE ACCOUNT WHERE THE GROUPS/USERS YOU WANT TO EXTRACT ARE LOCATED.

-----------IMPORTANT----------
THERE ARE SEVERAL SCRIPTS FOR EACH SPECIFIC FUNCTION:

- script-mail-type: Used to extract active users whose email ends in @yourpreferredemail.com
(To modify the script, edit it with Notepad++ and change @yourpreferredemail.com to the email address you want to filter).

- script-group-users: Used to retrieve all users belonging to a tenant's groups.

TO RUN WITH A DOUBLE CLICK FROM THE .bat FILE, JUST EDIT THE "Get-AzureADGroupsorUsers" FILE WITH NOTEPAD++ 
AND IN THE "%~dp0script.ps1" SECTION, CHANGE "script.ps1" FOR THE Script YOU WANT TO USE (EXAMPLE: "%~dp0script-group-users").

------------ENJOY IT :)-----------------
