# Requiere PowerShell 5.1+ (Windows) o PowerShell 7+ (cross-platform)

# 1. Instalar módulo Microsoft Graph (si no está instalado)
if (-not (Get-Module -ListAvailable -Name Microsoft.Graph)) {
    Install-Module Microsoft.Graph -Force -Scope CurrentUser
}

# 2. Conectar a Microsoft Graph con los permisos necesarios
Connect-MgGraph -Scopes "User.Read.All"

# 3. Obtener todos los usuarios activos con dominio @tumaildepreferencia.com
$users = Get-MgUser -All -Filter "accountEnabled eq true" | 
         Where-Object { $_.UserPrincipalName -like "*@tumaildepreferencia.com" }

# 4. Crear reporte con información relevante
$report = foreach ($user in $users) {
    [PSCustomObject]@{
        UserId           = $user.Id
        UserUPN          = $user.UserPrincipalName
        UserName         = $user.DisplayName
        GivenName        = $user.GivenName
        Surname          = $user.Surname
        JobTitle         = $user.JobTitle
        Department       = $user.Department
        Mail             = $user.Mail
        AccountEnabled   = $user.AccountEnabled
        LastLogin        = if ($user.SignInActivity) { $user.SignInActivity.LastSignInDateTime } else { "Never" }
        UserType         = $user.UserType
        CreationType     = $user.CreationType
    }
}

# 5. Exportar a CSV en el escritorio
$desktopPath = [Environment]::GetFolderPath("Desktop")
$outputPath = "$desktopPath\CircleCare_Active_Users.csv"
$report | Export-Csv -Path $outputPath -NoTypeInformation -Encoding UTF8

# 6. Mostrar resumen
Write-Host "`n✅ Reporte generado exitosamente" -ForegroundColor Green
Write-Host "📊 Usuarios encontrados: $($users.Count)" -ForegroundColor Cyan
Write-Host "📁 Archivo guardado en: $outputPath`n" -ForegroundColor Cyan

# 7. Mostrar vista previa (primeros 5 usuarios)
$report | Select-Object UserName, UserUPN, Department, LastLogin | Format-Table -AutoSize | Out-Host

# 8. Opción para abrir el archivo
$openFile = Read-Host "¿Desea abrir el archivo CSV ahora? (S/N)"
if ($openFile -eq "S" -or $openFile -eq "s") {
    Start-Process $outputPath
}

# Desconectar de Microsoft Graph
Disconnect-MgGraph | Out-Null