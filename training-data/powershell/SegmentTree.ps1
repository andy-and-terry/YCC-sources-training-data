class SegmentTree {
    [int[]]$Tree
    [int]$N

    SegmentTree([int[]]$values) {
        $this.N = $values.Length
        $this.Tree = [int[]]::new(4 * [Math]::Max($this.N, 1))
        if ($this.N -gt 0) {
            $this.Build($values, 1, 0, $this.N - 1)
        }
    }

    [void] Build([int[]]$values, [int]$node, [int]$lo, [int]$hi) {
        if ($lo -eq $hi) {
            $this.Tree[$node] = $values[$lo]
            return
        }
        $mid = [Math]::Floor(($lo + $hi) / 2)
        $this.Build($values, 2 * $node, $lo, $mid)
        $this.Build($values, 2 * $node + 1, $mid + 1, $hi)
        $this.Tree[$node] = $this.Tree[2 * $node] + $this.Tree[2 * $node + 1]
    }

    [void] Update([int]$index, [int]$value) {
        $this.UpdateNode(1, 0, $this.N - 1, $index, $value)
    }

    [void] UpdateNode([int]$node, [int]$lo, [int]$hi, [int]$index, [int]$value) {
        if ($lo -eq $hi) {
            $this.Tree[$node] = $value
            return
        }
        $mid = [Math]::Floor(($lo + $hi) / 2)
        if ($index -le $mid) {
            $this.UpdateNode(2 * $node, $lo, $mid, $index, $value)
        } else {
            $this.UpdateNode(2 * $node + 1, $mid + 1, $hi, $index, $value)
        }
        $this.Tree[$node] = $this.Tree[2 * $node] + $this.Tree[2 * $node + 1]
    }

    [int] Query([int]$left, [int]$right) {
        return $this.QueryNode(1, 0, $this.N - 1, $left, $right)
    }

    [int] QueryNode([int]$node, [int]$lo, [int]$hi, [int]$left, [int]$right) {
        if ($right -lt $lo -or $hi -lt $left) {
            return 0
        }
        if ($left -le $lo -and $hi -le $right) {
            return $this.Tree[$node]
        }
        $mid = [Math]::Floor(($lo + $hi) / 2)
        return $this.QueryNode(2 * $node, $lo, $mid, $left, $right) + $this.QueryNode(2 * $node + 1, $mid + 1, $hi, $left, $right)
    }
}

$tree = [SegmentTree]::new(@(1, 3, 5, 7, 9, 11))
$tree.Query(1, 3)
$tree.Update(1, 10)
$tree.Query(1, 3)
$tree.Query(0, 5)
