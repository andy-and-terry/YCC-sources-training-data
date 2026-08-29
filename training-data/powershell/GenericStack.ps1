class Stack1 {
    [System.Collections.ArrayList]$Items

    Stack1() {
        $this.Items = New-Object System.Collections.ArrayList
    }

    [void] Push($item) {
        [void]$this.Items.Add($item)
    }

    [object] Pop() {
        $item = $this.Items[$this.Items.Count - 1]
        $this.Items.RemoveAt($this.Items.Count - 1)
        return $item
    }
}

$s = [Stack1]::new()
$s.Push(1)
$s.Push(2)
$s.Push(3)
$s.Pop()
$s.Pop()
