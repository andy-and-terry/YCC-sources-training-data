class UnionFind {
    [int[]]$Parent

    UnionFind([int]$n) {
        $this.Parent = 0..($n - 1)
    }

    [int] Find([int]$x) {
        if ($this.Parent[$x] -eq $x) { return $x }
        return $this.Find($this.Parent[$x])
    }

    [void] Union([int]$x, [int]$y) {
        $rootX = $this.Find($x)
        $rootY = $this.Find($y)
        if ($rootX -ne $rootY) { $this.Parent[$rootX] = $rootY }
    }
}

$uf = [UnionFind]::new(5)
$uf.Union(0, 1)
$uf.Union(1, 2)
$uf.Find(0) -eq $uf.Find(2)
$uf.Find(0) -eq $uf.Find(3)
