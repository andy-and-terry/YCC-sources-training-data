class SkipList {
    [int]$MaxLevel
    [System.Collections.Generic.SortedSet[int][]]$Levels
    [System.Random]$Rng = [System.Random]::new(42)

    SkipList([int]$maxLevel) {
        $this.MaxLevel = $maxLevel
        $this.Levels = [System.Collections.Generic.SortedSet[int][]]::new($maxLevel)
        for ($i = 0; $i -lt $maxLevel; $i++) { $this.Levels[$i] = [System.Collections.Generic.SortedSet[int]]::new() }
    }

    [void] Insert([int]$value) {
        $level = 1
        while ($level -lt $this.MaxLevel -and $this.Rng.NextDouble() -lt 0.5) { $level++ }
        for ($i = 0; $i -lt $level; $i++) { [void]$this.Levels[$i].Add($value) }
    }

    [bool] Search([int]$value) {
        return $this.Levels[0].Contains($value)
    }
}

$list = [SkipList]::new(3)
foreach ($v in @(3, 1, 4, 1, 5, 9, 2, 6)) { $list.Insert($v) }
$list.Levels[0]
$list.Search(5)
$list.Search(7)
