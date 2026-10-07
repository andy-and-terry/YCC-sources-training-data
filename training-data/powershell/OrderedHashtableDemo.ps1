$plain   = @{ zebra = 1; apple = 2; mango = 3 }
$ordered = [ordered]@{ zebra = 1; apple = 2; mango = 3 }

"Ordered keys: $($ordered.Keys -join ', ')"
"Sorted plain: $(($plain.Keys | Sort-Object) -join ', ')"

$ordered.Add('kiwi', 4)
$ordered.Insert(0, 'first', 0)
$ordered.Remove('apple')

foreach ($entry in $ordered.GetEnumerator()) {
    '{0} = {1}' -f $entry.Key, $entry.Value
}

$ordered['mango'] += 10
$ordered.Contains('mango')
[pscustomobject]$ordered | Format-List
