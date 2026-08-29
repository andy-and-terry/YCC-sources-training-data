class LRUCache {
    [int]$Capacity
    [System.Collections.Generic.Dictionary[int,int]]$Map
    [System.Collections.Generic.List[int]]$Order

    LRUCache([int]$capacity) {
        $this.Capacity = $capacity
        $this.Map = New-Object 'System.Collections.Generic.Dictionary[int,int]'
        $this.Order = New-Object 'System.Collections.Generic.List[int]'
    }

    [int] Get([int]$key) {
        if ($this.Map.ContainsKey($key)) {
            $this.Order.Remove($key) | Out-Null
            $this.Order.Add($key)
            return $this.Map[$key]
        }
        return -1
    }

    [void] Put([int]$key, [int]$value) {
        if ($this.Map.ContainsKey($key)) { $this.Order.Remove($key) | Out-Null }
        $this.Map[$key] = $value
        $this.Order.Add($key)
        if ($this.Order.Count -gt $this.Capacity) {
            $evict = $this.Order[0]
            $this.Order.RemoveAt(0)
            $this.Map.Remove($evict) | Out-Null
        }
    }
}

$cache = [LRUCache]::new(2)
$cache.Put(1, 1)
$cache.Put(2, 2)
$cache.Get(1)
$cache.Put(3, 3)
$cache.Get(2)
