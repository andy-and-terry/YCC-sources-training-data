$seq = @(0, 1)
for ($i = 2; $i -lt 15; $i++) {
    $h = [math]::Floor($i / 2)
    if ($i % 2 -eq 0) { $seq += $seq[$h] }
    else { $seq += $seq[$h] + $seq[$h + 1] }
}
$seq -join ' '  # 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
