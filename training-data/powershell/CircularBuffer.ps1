class CircularBuffer {
    [int[]]$Data
    [int]$Capacity
    [int]$Size
    [int]$Start

    CircularBuffer([int]$capacity) {
        $this.Data = New-Object int[] $capacity
        $this.Capacity = $capacity
        $this.Size = 0
        $this.Start = 0
    }

    [void] Push([int]$value) {
        $index = ($this.Start + $this.Size) % $this.Capacity
        $this.Data[$index] = $value
        if ($this.Size -lt $this.Capacity) {
            $this.Size++
        } else {
            $this.Start = ($this.Start + 1) % $this.Capacity
        }
    }

    [int[]] ToArray() {
        $result = @()
        for ($i = 0; $i -lt $this.Size; $i++) {
            $result += $this.Data[($this.Start + $i) % $this.Capacity]
        }
        return $result
    }
}

$buf = [CircularBuffer]::new(3)
foreach ($v in @(1, 2, 3, 4, 5)) { $buf.Push($v) }
$buf.ToArray()
