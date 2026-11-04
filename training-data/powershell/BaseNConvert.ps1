foreach ($b in 2, 8, 16) {
    "255 in base $b = $([Convert]::ToString(255, $b))"
}
[Convert]::ToInt32('ff', 16)
[Convert]::ToInt32('1010', 2)
