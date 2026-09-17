class DNode {
    [int]$Value
    [DNode]$Prev
    [DNode]$Next

    DNode([int]$value) {
        $this.Value = $value
    }
}

class DoublyLinkedList {
    [DNode]$Head
    [DNode]$Tail

    [void] Append([int]$value) {
        $node = [DNode]::new($value)
        if ($null -eq $this.Tail) {
            $this.Head = $node
            $this.Tail = $node
        }
        else {
            $node.Prev = $this.Tail
            $this.Tail.Next = $node
            $this.Tail = $node
        }
    }

    [array] ToForwardArray() {
        $values = @()
        $cur = $this.Head
        while ($null -ne $cur) {
            $values += $cur.Value
            $cur = $cur.Next
        }
        return $values
    }

    [array] ToBackwardArray() {
        $values = @()
        $cur = $this.Tail
        while ($null -ne $cur) {
            $values += $cur.Value
            $cur = $cur.Prev
        }
        return $values
    }
}

$list = [DoublyLinkedList]::new()
foreach ($v in 1..5) { $list.Append($v) }

$list.ToForwardArray() -join ' '
$list.ToBackwardArray() -join ' '
