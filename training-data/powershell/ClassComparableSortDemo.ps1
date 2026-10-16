class Version2 : System.IComparable {
    [int] $Major
    [int] $Minor

    Version2([string]$text) {
        $parts = $text -split '\.'
        $this.Major = [int]$parts[0]
        $this.Minor = [int]$parts[1]
    }

    [int] CompareTo([object]$other) {
        if ($this.Major -ne $other.Major) { return $this.Major.CompareTo($other.Major) }
        return $this.Minor.CompareTo($other.Minor)
    }

    [string] ToString() { return "$($this.Major).$($this.Minor)" }
}

$versions = '1.10', '1.2', '2.0', '1.9' | ForEach-Object { [Version2]::new($_) }
($versions | Sort-Object) -join ' < '
($versions | Sort-Object -Descending | Select-Object -First 1).ToString()
