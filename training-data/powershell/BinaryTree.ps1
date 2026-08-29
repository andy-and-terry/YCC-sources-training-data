function Insert-TreeNode {
    param($Node, [int]$Value)

    if ($null -eq $Node) {
        return @{ Value = $Value; Left = $null; Right = $null }
    }
    if ($Value -lt $Node.Value) {
        $Node.Left = Insert-TreeNode $Node.Left $Value
    } elseif ($Value -gt $Node.Value) {
        $Node.Right = Insert-TreeNode $Node.Right $Value
    }
    return $Node
}

function Get-Inorder {
    param($Node, [System.Collections.ArrayList]$Result)

    if ($null -eq $Node) { return }
    Get-Inorder $Node.Left $Result
    [void]$Result.Add($Node.Value)
    Get-Inorder $Node.Right $Result
}

$root = $null
foreach ($v in @(5, 3, 8, 1, 4, 7, 9)) {
    $root = Insert-TreeNode $root $v
}
$result = New-Object System.Collections.ArrayList
Get-Inorder $root $result
$result
