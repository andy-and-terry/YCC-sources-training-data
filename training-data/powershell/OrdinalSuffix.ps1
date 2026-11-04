function Get-Ordinal([int]$n) {
    $suffix = switch ($n % 100) {
        { $_ -in 11..13 } { 'th'; break }
        default {
            switch ($n % 10) { 1 { 'st' } 2 { 'nd' } 3 { 'rd' } default { 'th' } }
        }
    }
    "$n$suffix"
}

(1, 2, 3, 4, 11, 12, 13, 21, 101, 111 | ForEach-Object { Get-Ordinal $_ }) -join ' '
