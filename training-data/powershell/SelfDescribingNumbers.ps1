function Test-SelfDescribing([string]$s) {
    for ($i = 0; $i -lt $s.Length; $i++) {
        $count = ($s.ToCharArray() | Where-Object { $_ -eq [char](48 + $i) }).Count
        if ($count -ne [int][string]$s[$i]) { return $false }
    }
    return $true
}

foreach ($s in '1210', '2020', '21200', '1211') {
    "$s $(Test-SelfDescribing $s)"
}
