function Invoke-Vigenere {
    param([string]$Text, [string]$Key, [switch]$Decrypt)
    $key = $Key.ToUpper()
    $k = 0
    $out = foreach ($c in $Text.ToUpper().ToCharArray()) {
        if ($c -match '[A-Z]') {
            $shift = [int]$key[$k % $key.Length] - 65
            if ($Decrypt) { $shift = -$shift }
            [char](([int]$c - 65 + $shift + 26) % 26 + 65)
            $k++
        } else {
            $c
        }
    }
    -join $out
}

$cipher = Invoke-Vigenere -Text 'Attack at dawn' -Key 'LEMON'
$cipher
Invoke-Vigenere -Text $cipher -Key 'LEMON' -Decrypt
