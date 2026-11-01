# Reverse-and-add until a palindrome; count the steps.
function Get-Reverse([bigint]$n) {
    $chars = $n.ToString().ToCharArray()
    [array]::Reverse($chars)
    return [bigint]::Parse((-join $chars))
}

function Get-Steps([bigint]$n) {
    for ($count = 0; $count -lt 100; $count++) {
        if ($count -gt 0 -and $n -eq (Get-Reverse $n)) { return $count }
        $n = $n + (Get-Reverse $n)
    }
    return -1
}

(56, 57, 59, 79, 89 | ForEach-Object { Get-Steps $_ }) -join ' '
