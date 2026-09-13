function New-ListNode {
    param($Value)
    [PSCustomObject]@{
        Value = $Value
        Next  = $null
    }
}

function Add-Node {
    param($Head, $Value)
    $node = New-ListNode -Value $Value
    if ($null -eq $Head) {
        return $node
    }
    $cur = $Head
    while ($null -ne $cur.Next) {
        $cur = $cur.Next
    }
    $cur.Next = $node
    return $Head
}

function Get-ListValues {
    param($Head)
    $values = @()
    $cur = $Head
    while ($null -ne $cur) {
        $values += $cur.Value
        $cur = $cur.Next
    }
    return $values
}

$head = $null
foreach ($v in 1..5) {
    $head = Add-Node -Head $head -Value $v
}

Get-ListValues -Head $head
