function Get-JosephusSurvivor {
    param([int]$Count, [int]$Step)

    $people = New-Object System.Collections.ArrayList
    for ($i = 1; $i -le $Count; $i++) { [void]$people.Add($i) }

    $index = 0
    while ($people.Count -gt 1) {
        $index = ($index + $Step - 1) % $people.Count
        Write-Output "eliminated: $($people[$index])"
        $people.RemoveAt($index)
    }
    return $people[0]
}

Get-JosephusSurvivor -Count 7 -Step 3
