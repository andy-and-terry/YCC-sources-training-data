function ConvertTo-PigLatin {
    param([string]$Word)
    if ($Word -match '^[aeiou]') { return "${Word}way" }
    if ($Word -match '^([^aeiou]+)(.*)$') { return "$($Matches[2])$($Matches[1])ay" }
    return "${Word}ay"
}

$sentence = 'the quick apple string rhythm'
($sentence -split ' ' | ForEach-Object { ConvertTo-PigLatin $_ }) -join ' '
