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