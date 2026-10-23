# Base64 encoding and decoding with System.Convert and text encodings.

function ConvertTo-Base64 {
    param([Parameter(Mandatory)][string]$Text, [System.Text.Encoding]$Encoding = [System.Text.Encoding]::UTF8)
    [Convert]::ToBase64String($Encoding.GetBytes($Text))
}

function ConvertFrom-Base64 {
    param([Parameter(Mandatory)][string]$Encoded, [System.Text.Encoding]$Encoding = [System.Text.Encoding]::UTF8)
    $Encoding.GetString([Convert]::FromBase64String($Encoded))
}

$message = 'Hello, PowerShell!'
$encoded = ConvertTo-Base64 $message
Write-Host "Original: $message"
Write-Host "Encoded:  $encoded"
Write-Host "Decoded:  $(ConvertFrom-Base64 $encoded)"

# Non-ASCII text depends on the chosen encoding
$unicode = 'caf' + [char]0x00E9
Write-Host "UTF8:  $(ConvertTo-Base64 $unicode)"
Write-Host "UTF16: $(ConvertTo-Base64 $unicode ([System.Text.Encoding]::Unicode))"

# Raw bytes round trip
$bytes = [byte[]](0, 1, 2, 250, 251, 255)
$b64 = [Convert]::ToBase64String($bytes)
$back = [Convert]::FromBase64String($b64)
Write-Host "Bytes -> $b64 -> $($back -join ',')"

# Padding depends on input length
foreach ($s in 'a', 'ab', 'abc') {
    Write-Host ("{0,-4} => {1}" -f $s, (ConvertTo-Base64 $s))
}

# Invalid input throws
try {
    [Convert]::FromBase64String('not*base64!')
} catch {
    Write-Host "Invalid input rejected: $($_.Exception.GetType().Name)"
}
