function New-TrieNode {
    return @{ Children = @{}; IsEnd = $false }
}

function Add-TrieWord {
    param($Root, [string]$Word)

    $node = $Root
    foreach ($c in $Word.ToCharArray()) {
        if (-not $node.Children.ContainsKey($c)) {
            $node.Children[$c] = New-TrieNode
        }
        $node = $node.Children[$c]
    }
    $node.IsEnd = $true
}

function Test-TrieContains {
    param($Root, [string]$Word)

    $node = $Root
    foreach ($c in $Word.ToCharArray()) {
        if (-not $node.Children.ContainsKey($c)) { return $false }
        $node = $node.Children[$c]
    }
    return $node.IsEnd
}

$trie = New-TrieNode
Add-TrieWord $trie "cat"
Add-TrieWord $trie "car"
Test-TrieContains $trie "cat"
Test-TrieContains $trie "ca"
