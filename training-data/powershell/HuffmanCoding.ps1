class HuffmanNode {
    [string]$Symbol
    [int]$Freq
    [HuffmanNode]$Left
    [HuffmanNode]$Right
}

function Get-HuffmanCodes {
    param([hashtable]$Freqs)

    $nodes = [System.Collections.Generic.List[HuffmanNode]]::new()
    foreach ($key in $Freqs.Keys) {
        $node = [HuffmanNode]::new()
        $node.Symbol = $key
        $node.Freq = $Freqs[$key]
        $nodes.Add($node)
    }

    while ($nodes.Count -gt 1) {
        $sorted = $nodes | Sort-Object Freq
        $a = $sorted[0]; $b = $sorted[1]
        $merged = [HuffmanNode]::new()
        $merged.Freq = $a.Freq + $b.Freq
        $merged.Left = $a
        $merged.Right = $b
        $nodes.Remove($a); $nodes.Remove($b)
        $nodes.Add($merged)
    }

    $codes = @{}
    function Assign([HuffmanNode]$node, [string]$prefix) {
        if ($null -eq $node.Left -and $null -eq $node.Right) {
            $codes[$node.Symbol] = $prefix
        } else {
            Assign $node.Left ($prefix + '0')
            Assign $node.Right ($prefix + '1')
        }
    }
    Assign $nodes[0] ''
    return $codes
}

Get-HuffmanCodes -Freqs @{ 'a' = 5; 'b' = 9; 'c' = 12; 'd' = 13 }
