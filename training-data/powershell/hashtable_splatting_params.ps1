function Show-Info { param([string]$Name, [int]$Age = 0) "$Name is $Age" }
$args1 = @{ Name = 'Ann'; Age = 30 }
Show-Info @args1
$h = [ordered]@{ a = 1; b = 2 }
$h.Keys | ForEach-Object { "$_=$($h[$_])" }
