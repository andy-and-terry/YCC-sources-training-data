function Get-NextGreaterElements {
    param([int[]]$Numbers)

    $result = [int[]]::new($Numbers.Length)
    for ($i = 0; $i -lt $result.Length; $i++) {
        $result[$i] = -1
    }

    $stack = New-Object System.Collections.Generic.Stack[int]
    for ($i = 0; $i -lt $Numbers.Length; $i++) {
        while ($stack.Count -gt 0 -and $Numbers[$stack.Peek()] -lt $Numbers[$i]) {
            $idx = $stack.Pop()
            $result[$idx] = $Numbers[$i]
        }
        $stack.Push($i)
    }

    return $result
}

Get-NextGreaterElements -Numbers @(2, 1, 2, 4, 3, 1)
