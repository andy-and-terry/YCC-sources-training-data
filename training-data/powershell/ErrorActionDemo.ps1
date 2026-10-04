Get-Item "C:\does\not\exist" -ErrorAction SilentlyContinue
"after silent error"

try {
    Get-Item "C:\does\not\exist" -ErrorAction Stop
}
catch {
    "Caught: $($_.Exception.GetType().Name)"
}
finally {
    "finally block ran"
}

$result = 10 / 4
"Result: $result"
trap { "trapped: $($_.Exception.Message)"; continue }
1 / 0
"continued after trap"
