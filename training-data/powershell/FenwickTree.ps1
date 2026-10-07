class FenwickTree {
    [int[]]$Tree
    [int]$Size

    FenwickTree([int]$size) {
        $this.Size = $size
        $this.Tree = [int[]]::new($size + 1)
    }

    [void] Update([int]$index, [int]$delta) {
        $i = $index + 1
        while ($i -le $this.Size) {
            $this.Tree[$i] += $delta
            $i += ($i -band (-$i))
        }
    }

    [int] PrefixSum([int]$index) {
        $sum = 0
        $i = $index + 1
        while ($i -gt 0) {
            $sum += $this.Tree[$i]
            $i -= ($i -band (-$i))
        }
        return $sum
    }

    [int] RangeSum([int]$left, [int]$right) {
        $leftSum = 0
        if ($left -gt 0) { $leftSum = $this.PrefixSum($left - 1) }
        return $this.PrefixSum($right) - $leftSum
    }
}

$values = @(3, 2, -1, 6, 5, 4, -3, 3, 7, 2)
$fenwick = [FenwickTree]::new($values.Length)
for ($i = 0; $i -lt $values.Length; $i++) { $fenwick.Update($i, $values[$i]) }
$fenwick.RangeSum(0, 9)
$fenwick.RangeSum(2, 5)
