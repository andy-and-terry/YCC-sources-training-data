# Integer (1..3999) to Roman numeral using a greedy table.
$table = [ordered]@{
    1000 = 'M'; 900 = 'CM'; 500 = 'D'; 400 = 'CD'; 100 = 'C'; 90 = 'XC'
    50 = 'L'; 40 = 'XL'; 10 = 'X'; 9 = 'IX'; 5 = 'V'; 4 = 'IV'; 1 = 'I'
}

function ConvertTo-Roman([int]$n) {
    $sb = [System.Text.StringBuilder]::new()
    foreach ($entry in $table.GetEnumerator()) {
        while ($n -ge $entry.Key) {
            [void]$sb.Append($entry.Value)
            $n -= $entry.Key
        }
    }
    $sb.ToString()
}

"$(ConvertTo-Roman 1994) $(ConvertTo-Roman 58)"
