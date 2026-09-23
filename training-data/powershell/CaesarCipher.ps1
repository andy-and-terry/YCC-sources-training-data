function Invoke-CaesarCipher {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Text,

        [Parameter(Mandatory)]
        [int]$Shift,

        [ValidateSet('Encode', 'Decode')]
        [string]$Mode = 'Encode'
    )

    $effectiveShift = switch ($Mode) {
        'Encode' { $Shift }
        'Decode' { -$Shift }
    }

    $result = -join ($Text.ToCharArray() | ForEach-Object {
        if ($_ -match '[a-zA-Z]') {
            $base = if ([char]::IsUpper($_)) { 65 } else { 97 }
            $offset = ([int][char]$_ - $base + $effectiveShift) % 26
            if ($offset -lt 0) { $offset += 26 }
            [char]($base + $offset)
        } else {
            $_
        }
    })
    return $result
}

$encoded = Invoke-CaesarCipher -Text "Hello, World!" -Shift 3 -Mode Encode
$encoded
Invoke-CaesarCipher -Text $encoded -Shift 3 -Mode Decode
