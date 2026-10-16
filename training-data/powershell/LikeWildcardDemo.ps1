$files = 'report.txt', 'Report_2024.TXT', 'notes.md', 'data1.csv', 'data22.csv', 'archive.tar.gz'

$files | Where-Object { $_ -like '*.txt' }
$files | Where-Object { $_ -clike '*.txt' }
$files | Where-Object { $_ -like 'data?.csv' }
$files | Where-Object { $_ -like 'data[0-9]*.csv' }
$files | Where-Object { $_ -notlike '*.*.*' }

[WildcardPattern]::new('r*', 'IgnoreCase').IsMatch('REPORT')
