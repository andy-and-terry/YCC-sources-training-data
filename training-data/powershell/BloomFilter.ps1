class BloomFilter {
    [bool[]]$Bits
    [int]$Size

    BloomFilter([int]$size) {
        $this.Size = $size
        $this.Bits = [bool[]]::new($size)
    }

    [int] HashOf([string]$value, [int]$seed) {
        $sum = 0
        foreach ($c in $value.ToCharArray()) { $sum += [int]$c }
        return (($sum * $seed) + $seed) % $this.Size
    }

    [void] Add([string]$value) {
        foreach ($seed in @(1, 7, 13)) { $this.Bits[$this.HashOf($value, $seed)] = $true }
    }

    [bool] MightContain([string]$value) {
        foreach ($seed in @(1, 7, 13)) {
            if (-not $this.Bits[$this.HashOf($value, $seed)]) { return $false }
        }
        return $true
    }
}

$filter = [BloomFilter]::new(32)
$filter.Add('apple')
$filter.Add('banana')
$filter.MightContain('apple')
$filter.MightContain('cherry')
