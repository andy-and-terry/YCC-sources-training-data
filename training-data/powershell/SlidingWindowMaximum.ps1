function Get-SlidingWindowMaximum {
    param([int[]]$Numbers, [int]$K)

    $result = New-Object System.Collections.Generic.List[int]
    $deque = New-Object System.Collections.Generic.List[int]

    for ($i = 0; $i -lt $Numbers.Length; $i++) {
        while ($deque.Count -gt 0 -and $Numbers[$deque[$deque.Count - 1]] -lt $Numbers[$i]) {
            $deque.RemoveAt($deque.Count - 1)
        }
        $deque.Add($i)

        if ($deque[0] -le $i - $K) {
            $deque.RemoveAt(0)
        }

        if ($i -ge $K - 1) {
            $result.Add($Numbers[$deque[0]])
        }
    }

    return $result
}

$numbers = @(1, 3, -1, -3, 5, 3, 6, 7)
(Get-SlidingWindowMaximum -Numbers $numbers -K 3) -join ","
