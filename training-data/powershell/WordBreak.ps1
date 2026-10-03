function Test-WordBreak {
    param([string]$Text, [string[]]$Dictionary)

    $n = $Text.Length
    $dp = [bool[]]::new($n + 1)
    $dp[0] = $true
    $wordSet = [System.Collections.Generic.HashSet[string]]::new($Dictionary)

    for ($i = 1; $i -le $n; $i++) {
        for ($j = 0; $j -lt $i; $j++) {
            if ($dp[$j] -and $wordSet.Contains($Text.Substring($j, $i - $j))) {
                $dp[$i] = $true
                break
            }
        }
    }
    return $dp[$n]
}

Test-WordBreak -Text 'applepenapple' -Dictionary @('apple', 'pen')
Test-WordBreak -Text 'catsandog' -Dictionary @('cats', 'dog', 'sand', 'and', 'cat')
