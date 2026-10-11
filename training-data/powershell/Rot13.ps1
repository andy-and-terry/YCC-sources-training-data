function Invoke-Rot13 {
    param([string]$Text)
    $chars = foreach ($c in $Text.ToCharArray()) {
        if ($c -cmatch '[a-z]') {
            [char](([int]$c - 97 + 13) % 26 + 97)
        } elseif ($c -cmatch '[A-Z]') {
            [char](([int]$c - 65 + 13) % 26 + 65)
        } else {
            $c
        }
    }
    -join $chars
}

$secret = Invoke-Rot13 'Hello, World!'
$secret
Invoke-Rot13 $secret
