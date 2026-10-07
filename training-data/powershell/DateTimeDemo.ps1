$date = [datetime]"2024-03-15 13:45:30"

$date.ToString("yyyy-MM-dd HH:mm:ss")
$date.ToString("dddd, d MMMM yyyy")
$date.DayOfWeek
$date.DayOfYear

$later = $date.AddDays(20).AddHours(5)
$later.ToString("yyyy-MM-dd HH:mm")
$date.AddMonths(11).ToString("yyyy-MM-dd")

$span = $later - $date
"Days: $($span.Days), Hours: $($span.Hours), Total hours: $($span.TotalHours)"

$ts = New-TimeSpan -Days 1 -Hours 6 -Minutes 30
$ts.TotalMinutes
$ts.ToString()

[datetime]::IsLeapYear(2024)
[datetime]::DaysInMonth(2024, 2)

$parsed = [datetime]::ParseExact("15/03/2024", "dd/MM/yyyy", [cultureinfo]::InvariantCulture)
$parsed.Month

if ($later -gt $date) { "later is after date" }
$utc = [datetime]::SpecifyKind($date, [DateTimeKind]::Utc)
$utc.ToString("o")
[DateTimeOffset]::new($utc).ToUnixTimeSeconds()
