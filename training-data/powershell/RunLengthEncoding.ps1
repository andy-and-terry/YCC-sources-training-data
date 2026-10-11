function ConvertTo-Rle {
    param([string]$Text)
    $sb = [System.Text.StringBuilder]::new()
    $i = 0
    while ($i -lt $Text.Length) {
        $j = $i
        while ($j -lt $Text.Length -and $Text[$j] -eq $Text[$i]) { $j++ }
        [void]$sb.Append($j - $i).Append($Text[$i])
        $i = $j
    }
    $sb.ToString()
}

function ConvertFrom-Rle {
    param([string]$Encoded)
    [regex]::Replace($Encoded, '(\d+)(\D)', { param($m) $m.Groups[2].Value * [int]$m.Groups[1].Value })
}

$enc = ConvertTo-Rle "WWWWBBBWWC"
$enc
ConvertFrom-Rle $enc
