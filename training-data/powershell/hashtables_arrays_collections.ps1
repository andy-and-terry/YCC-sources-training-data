$h = @{ b = 2; a = 1 }
$h['c'] = 3
$h.Remove('b')
$h.GetEnumerator() | Sort-Object Name | ForEach-Object { "$($_.Name)=$($_.Value)" }
[ordered]@{ z = 1; y = 2 }.Keys -join ','
$h.ContainsKey('a'); $h.Count
$arr = 1..10
$arr[2..4] -join ','
$arr[-1]; $arr.Length
($arr | Where-Object { $_ % 2 -eq 0 }) -join ' '
$list = [System.Collections.Generic.List[int]]::new()
$list.Add(3); $list.Add(1); $list.Sort()
$list -join ','
$stack = [System.Collections.Stack]::new(); $stack.Push(1); $stack.Push(2); $stack.Pop()
$queue = [System.Collections.Queue]::new(); $queue.Enqueue('a'); $queue.Dequeue()
$set = [System.Collections.Generic.HashSet[string]]::new(); $set.Add('x') | Out-Null; $set.Add('x')
@(1, 2) + @(3); ,@(1, 2) | ForEach-Object { $_.Count }
$matrix = @(@(1, 2), @(3, 4)); $matrix[1][0]
