# Count contiguous subarrays whose sum equals k (prefix sums + hashtable).
function Get-SubarrayCount([int[]]$nums, [int]$k) {
    $seen = @{ 0 = 1 }
    $total = 0
    $count = 0
    foreach ($x in $nums) {
        $total += $x
        $count += [int]$seen[$total - $k]
        $seen[$total] = 1 + [int]$seen[$total]
    }
    $count
}

Get-SubarrayCount @(1, 1, 1) 2
