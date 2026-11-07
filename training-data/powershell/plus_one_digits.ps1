function Get-PlusOne {
    param([int[]]$Digits)
    $d = $Digits.Clone()
    for ($i = $d.Count - 1; $i -ge 0; $i--) {
        if ($d[$i] -lt 9) { $d[$i]++; return $d }
        $d[$i] = 0
    }
    @(1) + $d
}

(Get-PlusOne 1, 2, 9) -join ','   # 1,3,0
(Get-PlusOne 9, 9) -join ','      # 1,0,0
