class FenwickTree {
    [int[]]$Tree
    [int]$Size

    FenwickTree([int]$size) {
        $this.Size = $size
        $this.Tree = New-Object 'int[]' ($size + 1)
    }

    [void] Update([int]$index, [int]$delta) {
        while ($index -le $this.Size) {
            $this.Tree[$index] += $delta
            $index += ($index -band (-$index))
        }
    }

    [int] PrefixSum([int]$index) {
        $sum = 0
        while ($index -gt 0) {
            $sum += $this.Tree[$index]
            $index -= ($index -band (-$index))
        }
        return $sum
    }

    [int] RangeSum([int]$lo, [int]$hi) {
        return $this.PrefixSum($hi) - $this.PrefixSum($lo - 1)
    }
}

$values = @(3, 2, -1, 6, 5, 4, -3, 3, 7, 2)
$tree = [FenwickTree]::new($values.Count)
for ($i = 0; $i -lt $values.Count; $i++) {
    $tree.Update($i + 1, $values[$i])
}

$tree.PrefixSum(5)
$tree.RangeSum(3, 7)
$tree.Update(4, 10)
$tree.RangeSum(3, 7)
