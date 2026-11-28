function Get-ReversedBits([int]$value) {
    $r = 0
    for ($i = 0; $i -lt 8; $i++) {
        $r = ($r -shl 1) -bor ($value -band 1)
        $value = $value -shr 1
    }
    return $r
}

foreach ($v in 1, 6, 13, 128) { "$v $(Get-ReversedBits $v)" }  # 128 96 176 1
