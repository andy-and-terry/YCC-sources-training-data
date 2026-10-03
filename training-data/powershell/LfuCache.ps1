class LfuCache {
    [int]$Capacity
    [hashtable]$Values = @{}
    [hashtable]$Freqs = @{}

    LfuCache([int]$capacity) {
        $this.Capacity = $capacity
    }

    [object] Get([int]$key) {
        if ($this.Values.ContainsKey($key)) {
            $this.Freqs[$key]++
            return $this.Values[$key]
        }
        return -1
    }

    [void] Put([int]$key, [object]$value) {
        if ($this.Values.ContainsKey($key)) {
            $this.Values[$key] = $value
            $this.Freqs[$key]++
            return
        }
        if ($this.Values.Count -ge $this.Capacity) {
            $leastKey = $null
            $leastFreq = [int]::MaxValue
            foreach ($k in $this.Values.Keys) {
                if ($this.Freqs[$k] -lt $leastFreq) { $leastFreq = $this.Freqs[$k]; $leastKey = $k }
            }
            $this.Values.Remove($leastKey)
            $this.Freqs.Remove($leastKey)
        }
        $this.Values[$key] = $value
        $this.Freqs[$key] = 1
    }
}

$cache = [LfuCache]::new(2)
$cache.Put(1, 'a')
$cache.Put(2, 'b')
$cache.Get(1)
$cache.Put(3, 'c')
$cache.Values.Keys
