function ConvertFrom-Binary {
    param([string]$Str)

    return [Convert]::ToInt32($Str, 2)
}

ConvertFrom-Binary -Str "1011"
