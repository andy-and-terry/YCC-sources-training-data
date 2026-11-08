function Invoke-Rot47([string]$Text) {
    -join ($Text.ToCharArray() | ForEach-Object {
        $n = [int]$_
        if ($n -ge 33 -and $n -le 126) { [char](33 + (($n - 33 + 47) % 94)) } else { $_ }
    })
}

$e = Invoke-Rot47 'Hello, World!'
$e
Invoke-Rot47 $e
