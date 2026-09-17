class DListNode {
    [object]$Value
    [DListNode]$Prev
    [DListNode]$Next

    DListNode([object]$value) {
        $this.Value = $value
    }
}

class DoublyLinkedList {
    [DListNode]$Head
    [DListNode]$Tail

    [void] AddLast([object]$value) {
        $node = [DListNode]::new($value)
        if ($null -eq $this.Head) {
            $this.Head = $node
            $this.Tail = $node
        } else {
            $node.Prev = $this.Tail
            $this.Tail.Next = $node
            $this.Tail = $node
        }
    }

    [void] RemoveFirst() {
        if ($null -eq $this.Head) { return }
        $this.Head = $this.Head.Next
        if ($null -ne $this.Head) {
            $this.Head.Prev = $null
        } else {
            $this.Tail = $null
        }
    }

    [array] ToArrayForward() {
        $result = @()
        $node = $this.Head
        while ($null -ne $node) {
            $result += $node.Value
            $node = $node.Next
        }
        return $result
    }

    [array] ToArrayBackward() {
        $result = @()
        $node = $this.Tail
        while ($null -ne $node) {
            $result += $node.Value
            $node = $node.Prev
        }
        return $result
    }
}

$list = [DoublyLinkedList]::new()
foreach ($v in @(1, 2, 3, 4)) { $list.AddLast($v) }
$list.ToArrayForward()
$list.RemoveFirst()
$list.ToArrayBackward()
