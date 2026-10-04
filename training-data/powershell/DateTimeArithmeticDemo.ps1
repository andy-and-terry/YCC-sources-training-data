$start = [datetime]"2024-01-31 09:30:00"

"start:      $($start.ToString('yyyy-MM-dd HH:mm'))"
"plus days:  $($start.AddDays(30).ToString('yyyy-MM-dd'))"
"plus month: $($start.AddMonths(1).ToString('yyyy-MM-dd'))"
"weekday:    $($start.DayOfWeek)"
"leap year:  $([datetime]::IsLeapYear($start.Year))"
"days in Feb: $([datetime]::DaysInMonth(2024, 2))"

$end = [datetime]"2024-03-15 18:00:00"
$span = $end - $start
"span: $($span.Days) days, $($span.Hours) hours"
"total hours: $([math]::Round($span.TotalHours, 1))"

$timeout = New-TimeSpan -Minutes 90
"timeout: $($timeout.ToString())"
"deadline: $($start.Add($timeout).ToString('HH:mm'))"
