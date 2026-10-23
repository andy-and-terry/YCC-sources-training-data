# Set-StrictMode turns common sloppy-code mistakes into errors.
Set-StrictMode -Version Latest

$defined = 5
"defined: $defined"

try {
    # Reading a variable that was never assigned is an error under strict mode.
    "value: $notDefined"
} catch {
    "caught: $($_.Exception.Message)"
}

try {
    # So is reading a property that does not exist on an object.
    $obj = [pscustomobject]@{ Name = "Ada" }
    $obj.Age
} catch {
    "caught: $($_.Exception.Message)"
}

# Turning strict mode off restores the lenient behaviour (missing values become $null).
Set-StrictMode -Off
"after off: [$notDefined]"
