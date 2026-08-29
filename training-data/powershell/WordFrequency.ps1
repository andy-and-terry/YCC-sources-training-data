function Get-WordFrequency {
    param([string]$Text)

    $freq = @{}
    foreach ($word in $Text.ToLower().Split(' ')) {
        if ($freq.ContainsKey($word)) {
            $freq[$word]++
        } else {
            $freq[$word] = 1
        }
    }
    return $freq
}

Get-WordFrequency -Text "the quick brown fox the lazy fox"
