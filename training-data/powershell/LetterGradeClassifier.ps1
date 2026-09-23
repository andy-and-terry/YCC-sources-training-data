function ConvertTo-LetterGrade {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [ValidateRange(0, 100)]
        [int]$Score
    )

    process {
        try {
            $grade = switch ($Score) {
                { $_ -ge 90 } { 'A'; break }
                { $_ -ge 80 } { 'B'; break }
                { $_ -ge 70 } { 'C'; break }
                { $_ -ge 60 } { 'D'; break }
                default { 'F' }
            }
            [PSCustomObject]@{
                Score = $Score
                Grade = $grade
            }
        }
        catch {
            Write-Output "error grading score: $_"
        }
        finally {
            Write-Verbose "processed score $Score"
        }
    }
}

@(95, 82, 71, 60, 40) | ConvertTo-LetterGrade
