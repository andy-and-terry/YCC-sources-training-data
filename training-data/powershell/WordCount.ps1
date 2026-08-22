$text = "the quick brown fox jumps over the lazy dog the fox runs"

$text.ToLower().Split(' ') |
    Group-Object |
    Sort-Object Count -Descending |
    Select-Object -First 3 -Property Name, Count
