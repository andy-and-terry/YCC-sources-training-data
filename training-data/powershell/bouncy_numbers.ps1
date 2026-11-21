# Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
function Test-Bouncy([int]$n) {
    $d = $n.ToString().ToCharArray()
    $up = ($d | Sort-Object) -join ''
    $down = ($d | Sort-Object -Descending) -join ''
    $s = $d -join ''
    return ($s -ne $up) -and ($s -ne $down)
}

(1..999 | Where-Object { Test-Bouncy $_ }).Count
