function Test-Pangram {
    param([string]$Text)
    $letters = $Text.ToLower().ToCharArray() | Where-Object { $_ -match '[a-z]' } | Sort-Object -Unique
    return $letters.Count -eq 26
}

Test-Pangram "The quick brown fox jumps over the lazy dog"
Test-Pangram "Hello, world"
