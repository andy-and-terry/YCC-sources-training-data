function Format-Wrapped([string]$Text, [int]$Width) {
    $line = ''
    foreach ($word in $Text -split '\s+') {
        if ($line -and ($line.Length + 1 + $word.Length) -gt $Width) {
            $line
            $line = $word
        } else {
            $line = if ($line) { "$line $word" } else { $word }
        }
    }
    if ($line) { $line }
}

Format-Wrapped 'the quick brown fox jumps over the lazy dog' 15 | ForEach-Object { '|{0,-15}|' -f $_ }
