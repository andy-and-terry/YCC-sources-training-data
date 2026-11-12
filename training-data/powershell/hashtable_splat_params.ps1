function Show-Info { param([string]$Name, [int]$Age) "$Name is $Age" }
$args2 = @{ Name = 'Ann'; Age = 30 }
Show-Info @args2
