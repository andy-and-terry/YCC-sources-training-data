class ListNode {
    $Value
    [ListNode]$Next

    ListNode($value) {
        $this.Value = $value
        $this.Next = $null
    }
}

class LinkedList {
    [ListNode]$Head

    [void] Append($value) {
        $node = [ListNode]::new($value)
        if ($null -eq $this.Head) {
            $this.Head = $node
            return
        }
        $current = $this.Head
        while ($null -ne $current.Next) {
            $current = $current.Next
        }
        $current.Next = $node
    }

    [string] ToString() {
        $values = @()
        $current = $this.Head
        while ($null -ne $current) {
            $values += $current.Value
            $current = $current.Next
        }
        return $values -join " -> "
    }
}

$list = [LinkedList]::new()
$list.Append(1)
$list.Append(2)
$list.Append(3)
$list.ToString()
