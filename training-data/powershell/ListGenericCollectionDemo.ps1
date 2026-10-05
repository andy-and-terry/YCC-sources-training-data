$list = [System.Collections.Generic.List[int]]::new()
foreach ($i in 5, 3, 8, 1) { $list.Add($i) }
$list.Insert(1, 99)
$list.Remove(3) | Out-Null
$list.Sort()
"Sorted: $($list -join ', ')"
"Count: $($list.Count), Contains 8: $($list.Contains(8))"
"IndexOf 99: $($list.IndexOf(99))"

$dict = [System.Collections.Generic.Dictionary[string, int]]::new()
$dict['apples'] = 3
$dict['pears'] = 5
if ($dict.TryGetValue('apples', [ref]$null)) { 'apples present' }
foreach ($kv in $dict.GetEnumerator()) { '{0}={1}' -f $kv.Key, $kv.Value }
