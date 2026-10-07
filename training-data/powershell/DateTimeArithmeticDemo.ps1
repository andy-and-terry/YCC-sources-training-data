$start = [datetime]'2024-01-31 09:30:00'
$end   = [datetime]'2024-03-15 17:00:00'

$span = $end - $start
"Total days: {0:N1}" -f $span.TotalDays
"Span: {0}d {1}h {2}m" -f $span.Days, $span.Hours, $span.Minutes

$start.AddMonths(1).ToString('yyyy-MM-dd')
$start.AddDays(-45).ToString('ddd dd MMM yyyy')
$start.DayOfWeek
[datetime]::DaysInMonth(2024, 2)
[datetime]::IsLeapYear(2100)

$ts = New-TimeSpan -Hours 36 -Minutes 15
$ts.ToString()
($start + $ts).ToString('s')
