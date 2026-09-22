$people = @(
    [PSCustomObject]@{ Name = "Alice"; Dept = "Eng"; Age = 30 }
    [PSCustomObject]@{ Name = "Bob"; Dept = "Sales"; Age = 25 }
    [PSCustomObject]@{ Name = "Carol"; Dept = "Eng"; Age = 35 }
    [PSCustomObject]@{ Name = "Dave"; Dept = "Sales"; Age = 28 }
)

$grouped = $people | Group-Object -Property Dept
foreach ($group in $grouped) {
    Write-Output "$($group.Name): $($group.Count)"
}

$sorted = $people | Sort-Object -Property Dept, @{ Expression = "Age"; Descending = $true }
$sorted | ForEach-Object { Write-Output "$($_.Name) ($($_.Dept), $($_.Age))" }
