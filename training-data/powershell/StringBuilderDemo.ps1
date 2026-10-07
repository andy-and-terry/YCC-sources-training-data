$sb = [System.Text.StringBuilder]::new()
foreach ($i in 1..5) {
    [void]$sb.Append($i).Append(',')
}
[void]$sb.AppendLine()
[void]$sb.AppendFormat('{0:N1}%', 99.5)
$sb.ToString()

$sb.Length = $sb.Length - 1
$sb.Insert(0, '>> ').Replace(',', ';').ToString()
"Length: $($sb.Length)"

$sb.Clear() | Out-Null
"Empty: $($sb.Length -eq 0)"
