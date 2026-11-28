function Get-Bwt([string]$s) {
    $rots = 0..($s.Length - 1) | ForEach-Object { $s.Substring($_) + $s.Substring(0, $_) }
    $sorted = [string[]]$rots
    [Array]::Sort($sorted, [StringComparer]::Ordinal)
    -join ($sorted | ForEach-Object { $_[-1] })
}
Get-Bwt 'banana$'
