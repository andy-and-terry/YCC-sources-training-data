class FenwickTree {
    [int[]]$Tree
    [int]$N

    FenwickTree([int]$n) {
        $this.N = $n
        $this.Tree = [int[]]::new($n + 1)
    }

    [void] Add([int]$index, [int]$delta) {
        $i = $index + 1
        while ($i -le $this.N) {
            $this.Tree[$i] += $delta
            $i += $i -band (-$i)
        }
    }

    [int] PrefixSum([int]$index) {
        $sum = 0
        $i = $index + 1
        while ($i -gt 0) {
            $sum += $this.Tree[$i]
            $i -= $i -band (-$i)
        }
        return $sum
    }

    [int] RangeSum([int]$left, [int]$right) {
        if ($left -eq 0) {
            return $this.PrefixSum($right)
        }
        return $this.PrefixSum($right) - $this.PrefixSum($left - 1)
    }
}

$values = @(1, 3, 5, 7, 9, 11)
$fenwick = [FenwickTree]::new($values.Length)
for ($i = 0; $i -lt $values.Length; $i++) {
    $fenwick.Add($i, $values[$i])
}

$fenwick.RangeSum(1, 3)
$fenwick.Add(1, 10)
$fenwick.RangeSum(1, 3)
$fenwick.RangeSum(0, 5)
