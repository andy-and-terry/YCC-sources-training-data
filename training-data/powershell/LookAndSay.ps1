function Get-NextTerm {
    param([string]$Term)
    $runs = [regex]::Matches($Term, '(\d)\1*')
    ($runs | ForEach-Object { "$($_.Length)$($_.Value[0])" }) -join ''
}

$term = '1'
1..8 | ForEach-Object {
    $term
    $term = Get-NextTerm $term
}
