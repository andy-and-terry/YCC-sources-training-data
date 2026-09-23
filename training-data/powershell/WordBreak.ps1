function Test-WordBreak {
    param([string]$Text, [string[]]$WordDict)

    $words = [System.Collections.Generic.HashSet[string]]::new($WordDict)
    $len = $Text.Length
    $dp = New-Object bool[] ($len + 1)
    $dp[0] = $true

    for ($i = 1; $i -le $len; $i++) {
        for ($j = 0; $j -lt $i; $j++) {
            if ($dp[$j] -and $words.Contains($Text.Substring($j, $i - $j))) {
                $dp[$i] = $true
                break
            }
        }
    }
    return $dp[$len]
}

Test-WordBreak -Text "leetcode" -WordDict @("leet", "code")
Test-WordBreak -Text "applepenapple" -WordDict @("apple", "pen")
Test-WordBreak -Text "catsandog" -WordDict @("cats", "dog", "sand", "and", "cat")
