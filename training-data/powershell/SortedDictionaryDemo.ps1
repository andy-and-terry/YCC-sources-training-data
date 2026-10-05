$sorted = [System.Collections.Generic.SortedDictionary[string, int]]::new()
$sorted['pear'] = 3
$sorted['apple'] = 7
$sorted['fig'] = 1
foreach ($kv in $sorted.GetEnumerator()) { '{0,-6} {1}' -f $kv.Key, $kv.Value }

$ordered = [ordered]@{ first = 1; second = 2; third = 3 }
$ordered.Insert(1, 'inserted', 99)
$ordered.Keys -join ','
$ordered.Remove('first')
$ordered.Keys -join ','

$set = [System.Collections.Generic.HashSet[string]]::new([string[]]('a', 'b', 'a'))
"unique: $($set.Count)"
