function Get-Crc8([byte[]]$Data) {
    [byte]$crc = 0
    foreach ($b in $Data) {
        $crc = $crc -bxor $b
        1..8 | ForEach-Object {
            if ($crc -band 0x80) { $crc = [byte]((($crc -shl 1) -bxor 0x07) -band 0xFF) }
            else { $crc = [byte](($crc -shl 1) -band 0xFF) }
        }
    }
    $crc
}

'{0:x2}' -f (Get-Crc8 ([Text.Encoding]::ASCII.GetBytes('123456789')))
