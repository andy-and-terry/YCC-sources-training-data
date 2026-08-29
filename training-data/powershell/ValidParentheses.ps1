function Test-ValidParens {
    param([string]$Str)

    $stack = New-Object System.Collections.Generic.Stack[char]
    $pairs = @{ ')' = '('; ']' = '['; '}' = '{' }
    foreach ($c in $Str.ToCharArray()) {
        if ($c -in '(', '[', '{') {
            $stack.Push($c)
        } elseif ($c -in ')', ']', '}') {
            if ($stack.Count -eq 0 -or $stack.Pop() -ne $pairs[$c]) {
                return $false
            }
        }
    }
    return $stack.Count -eq 0
}

Test-ValidParens -Str "{[()]}"
Test-ValidParens -Str "{[(])}"
