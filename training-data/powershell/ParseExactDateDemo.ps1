$culture = [System.Globalization.CultureInfo]::InvariantCulture

$d = [datetime]::ParseExact('25/12/2024 18:30', 'dd/MM/yyyy HH:mm', $culture)
$d.ToString('yyyy-MM-dd HH:mm')
$d.DayOfWeek

$ok = [datetime]::TryParse('not a date', [ref]$null)
"TryParse bad input: $ok"

$parsed = [datetime]::MinValue
if ([datetime]::TryParseExact('2024-02-30', 'yyyy-MM-dd', $culture, 'None', [ref]$parsed)) {
    'valid'
} else {
    'invalid calendar date'
}

$d.AddDays(10).ToString('o')
