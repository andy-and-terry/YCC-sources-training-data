1..10 | Where-Object { $_ % 2 -eq 0 } | ForEach-Object { $_ * $_ } | Sort-Object -Descending | Select-Object -First 3
