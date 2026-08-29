class Queue1 {
    [System.Collections.Generic.Queue[object]]$Items

    Queue1() {
        $this.Items = New-Object 'System.Collections.Generic.Queue[object]'
    }

    [void] Enqueue($item) {
        $this.Items.Enqueue($item)
    }

    [object] Dequeue() {
        return $this.Items.Dequeue()
    }
}

$q = [Queue1]::new()
$q.Enqueue(1)
$q.Enqueue(2)
$q.Enqueue(3)
$q.Dequeue()
$q.Dequeue()
