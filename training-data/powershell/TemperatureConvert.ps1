function Convert-Temperature {
    param(
        [double]$Value,
        [ValidateSet('C', 'F', 'K')][string]$From,
        [ValidateSet('C', 'F', 'K')][string]$To
    )
    $celsius = switch ($From) {
        'C' { $Value }
        'F' { ($Value - 32) * 5 / 9 }
        'K' { $Value - 273.15 }
    }
    switch ($To) {
        'C' { $celsius }
        'F' { $celsius * 9 / 5 + 32 }
        'K' { $celsius + 273.15 }
    }
}

'100 C = {0:N1} F' -f (Convert-Temperature 100 C F)
'98.6 F = {0:N1} C' -f (Convert-Temperature 98.6 F C)
'0 K = {0:N2} C' -f (Convert-Temperature 0 K C)
