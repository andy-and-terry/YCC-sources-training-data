function ConvertTo-Varint([int]$N) {
    $out = @()
    while ($N -ge 128) {
        $out += ($N % 128) -bor 128
        $N = [math]::Floor($N / 128)
    }
    $out + $N
}

(ConvertTo-Varint 300 | ForEach-Object { '{0:x2}' -f $_ }) -join ' '
