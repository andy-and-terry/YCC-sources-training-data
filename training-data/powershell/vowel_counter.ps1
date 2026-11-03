$text = "Education is beautiful".ToLower()
foreach ($v in 'a', 'e', 'i', 'o', 'u') {
    $n = ($text.ToCharArray() | Where-Object { $_ -eq $v }).Count
    Write-Host -NoNewline "$v=$n "
}
Write-Host
