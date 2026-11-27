function Get-Fletcher16([byte[]]$Data) {
    $s1 = 0; $s2 = 0
    foreach ($b in $Data) {
        $s1 = ($s1 + $b) % 255
        $s2 = ($s2 + $s1) % 255
    }
    ($s2 -shl 8) -bor $s1
}

'{0:x}' -f (Get-Fletcher16 ([Text.Encoding]::ASCII.GetBytes('abcde')))
