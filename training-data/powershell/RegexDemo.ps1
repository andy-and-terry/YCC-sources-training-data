$text = "Contact: alice@example.com or bob@sample.org"

if ($text -match '(\w+)@(\w+\.\w+)') {
    "user=$($Matches[1]) domain=$($Matches[2])"
}

$emails = [regex]::Matches($text, '[\w.]+@[\w.]+') | ForEach-Object { $_.Value }
$emails

$redacted = $text -replace '[\w.]+@[\w.]+', '[redacted]'
$redacted
