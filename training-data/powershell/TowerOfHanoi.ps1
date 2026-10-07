function Invoke-TowerOfHanoi {
    param([int]$Disks, [string]$From = 'A', [string]$To = 'C', [string]$Via = 'B')

    if ($Disks -eq 0) { return }
    Invoke-TowerOfHanoi -Disks ($Disks - 1) -From $From -To $Via -Via $To
    Write-Output "Move disk $Disks from $From to $To"
    Invoke-TowerOfHanoi -Disks ($Disks - 1) -From $Via -To $To -Via $From
}

Invoke-TowerOfHanoi -Disks 3
