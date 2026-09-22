class FenwickTree {
    [int[]]$Tree
    [int]$Size

    FenwickTree([int]$size) {
        $this.Size = $size
        $this.Tree = [int[]]::new($size + 1)
    }

    [void] Add([int]$index, [int]$delta) {
        $i = $index
        while ($i -le $this.Size) {
            $this.Tree[$i] += $delta
            $i += ($i -band (-$i))
        }
    }

    [int] PrefixSum([int]$index) {
        $sum = 0
        $i = $index
        while ($i -gt 0) {
            $sum += $this.Tree[$i]
            $i -= ($i -band (-$i))
        }
        return $sum
    }

    [int] RangeSum([int]$left, [int]$right) {
        return $this.PrefixSum($right) - $this.PrefixSum($left - 1)
    }
}

$values = @(3, 2, -1, 6, 5, 4, -3, 3, 7, 2)
$fenwick = [FenwickTree]::new($values.Count)
for ($i = 0; $i -lt $values.Count; $i++) {
    $fenwick.Add($i + 1, $values[$i])
}

$fenwick.PrefixSum(5)
$fenwick.RangeSum(3, 7)

$fenwick.Add(3, 10)
$fenwick.RangeSum(3, 7)
