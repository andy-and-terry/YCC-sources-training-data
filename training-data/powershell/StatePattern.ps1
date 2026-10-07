class TrafficLight {
    [string]$State = 'Red'

    [void] Next() {
        $this.State = switch ($this.State) {
            'Red'    { 'Green' }
            'Green'  { 'Yellow' }
            'Yellow' { 'Red' }
        }
    }

    [string] ToString() {
        return $this.State
    }
}

$light = [TrafficLight]::new()
for ($i = 0; $i -lt 5; $i++) {
    $light.ToString()
    $light.Next()
}
