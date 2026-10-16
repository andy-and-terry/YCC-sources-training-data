$before = 'apple', 'banana', 'cherry', 'date'
$after = 'banana', 'cherry', 'elderberry', 'date', 'fig'

Compare-Object -ReferenceObject $before -DifferenceObject $after |
    ForEach-Object {
        $side = if ($_.SideIndicator -eq '<=') { 'removed' } else { 'added' }
        '{0}: {1}' -f $side, $_.InputObject
    }

Compare-Object $before $after -IncludeEqual -ExcludeDifferent | ForEach-Object { "common: $($_.InputObject)" }

$a = [PSCustomObject]@{ Id = 1; Name = 'x' }
$b = [PSCustomObject]@{ Id = 1; Name = 'y' }
Compare-Object $a $b -Property Id, Name
