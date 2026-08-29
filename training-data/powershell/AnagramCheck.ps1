function Get-Normalized {
    param([string]$Str)

    $chars = ($Str.ToLower() -replace ' ', '').ToCharArray()
    return -join ($chars | Sort-Object)
}

function Test-Anagram {
    param([string]$A, [string]$B)

    return (Get-Normalized $A) -eq (Get-Normalized $B)
}

Test-Anagram -A "listen" -B "silent"
Test-Anagram -A "hello" -B "world"
