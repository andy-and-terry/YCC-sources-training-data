function Test-Palindrome {
    param([string]$Str)

    $normalized = ($Str.ToLower() -replace '[^a-z0-9]', '')
    $reversed = -join ($normalized.ToCharArray() | ForEach-Object { $_ })[-1..-($normalized.Length)]
    return $normalized -eq $reversed
}

Test-Palindrome -Str "A man, a plan, a canal: Panama"
Test-Palindrome -Str "hello"
