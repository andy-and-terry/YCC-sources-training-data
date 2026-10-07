[Flags()] enum FilePermissions {
    None    = 0
    Read    = 1
    Write   = 2
    Execute = 4
}

function Get-PermissionSummary([FilePermissions]$permissions) {
    $parts = @()
    foreach ($value in [Enum]::GetValues([FilePermissions])) {
        if ($value -ne [FilePermissions]::None -and $permissions.HasFlag($value)) {
            $parts += $value.ToString()
        }
    }
    if ($parts.Count -eq 0) { return 'None' }
    return $parts -join ', '
}

$readWrite = [FilePermissions]([FilePermissions]::Read -bor [FilePermissions]::Write)
$full = [FilePermissions]([FilePermissions]::Read -bor [FilePermissions]::Write -bor [FilePermissions]::Execute)

Get-PermissionSummary $readWrite
Get-PermissionSummary $full
"read-write includes Write: $($readWrite.HasFlag([FilePermissions]::Write))"
"read-write includes Execute: $($readWrite.HasFlag([FilePermissions]::Execute))"
