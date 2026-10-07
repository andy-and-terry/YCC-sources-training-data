function Expand-AroundCenter {
    param([string]$S, [int]$Left, [int]$Right)

    while ($Left -ge 0 -and $Right -lt $S.Length -and $S[$Left] -eq $S[$Right]) {
        $Left--
        $Right++
    }
    return $S.Substring($Left + 1, $Right - $Left - 1)
}

function Get-LongestPalindromicSubstring {
    param([string]$Text)

    $best = ''
    for ($i = 0; $i -lt $Text.Length; $i++) {
        $odd = Expand-AroundCenter -S $Text -Left $i -Right $i
        $even = Expand-AroundCenter -S $Text -Left $i -Right ($i + 1)
        foreach ($candidate in @($odd, $even)) {
            if ($candidate.Length -gt $best.Length) { $best = $candidate }
        }
    }
    return $best
}

Get-LongestPalindromicSubstring -Text "babad"
