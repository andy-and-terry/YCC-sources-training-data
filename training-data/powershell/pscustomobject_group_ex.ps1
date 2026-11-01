$people = @(
  [pscustomobject]@{ Name = 'Ann'; Dept = 'IT'; Pay = 100 },
  [pscustomobject]@{ Name = 'Bob'; Dept = 'HR'; Pay = 80 },
  [pscustomobject]@{ Name = 'Cy';  Dept = 'IT'; Pay = 120 }
)
$people | Group-Object Dept | ForEach-Object {
  '{0}: {1}' -f $_.Name, ($_.Group | Measure-Object Pay -Sum).Sum
}
