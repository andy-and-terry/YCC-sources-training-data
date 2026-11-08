function Move-Disks([int]$N, [string]$A, [string]$B, [string]$C) {
    if ($N -eq 0) { return }
    Move-Disks ($N - 1) $A $C $B
    "$A->$C"
    Move-Disks ($N - 1) $B $A $C
}

$moves = @(Move-Disks 3 'A' 'B' 'C')
"$($moves.Count): $($moves -join ' ')"
