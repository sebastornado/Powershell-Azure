# Requiere PowerShell 5.1+ (Windows) o PowerShell 7+ (cross-platform)

# 1. Instalar módulo Microsoft Graph (si no está instalado)
if (-not (Get-Module -ListAvailable -Name Microsoft.Graph)) {
    Install-Module Microsoft.Graph -Force -Scope CurrentUser
}

# 2. Conectar a Microsoft Graph con los permisos necesarios
Connect-MgGraph -Scopes "Group.Read.All","User.Read.All"

# 3. Obtener todos los grupos
$groups = Get-MgGroup -All

# 4. Recopilar información
$report = @()
$totalGroups = $groups.Count
$counter = 0

foreach ($group in $groups) {
    $counter++
    Write-Progress -Activity "Procesando grupos" -Status "$counter/$totalGroups" -PercentComplete ($counter/$totalGroups*100)
    
    $members = Get-MgGroupMember -GroupId $group.Id -All | Where-Object { $_.AdditionalProperties['@odata.type'] -eq "#microsoft.graph.user" }
    
    foreach ($member in $members) {
        $user = Get-MgUser -UserId $member.Id
        $report += [PSCustomObject]@{
            GroupId          = $group.Id
            GroupName        = $group.DisplayName
            GroupDescription = $group.Description
            GroupType        = if ($group.SecurityEnabled) { "Security" } else { "Microsoft 365" }
            UserId           = $user.Id
            UserUPN         = $user.UserPrincipalName
            UserName        = $user.DisplayName
            UserType        = $user.UserType
        }
    }
}

# 5. Exportar a CSV
$desktopPath = [Environment]::GetFolderPath("Desktop")
$report | Export-Csv -Path "$desktopPath\AzureAD_Groups_Members.csv" -NoTypeInformation -Encoding UTF8

Write-Host "✅ Reporte generado: $desktopPath\AzureAD_Groups_Members.csv" -ForegroundColor Green