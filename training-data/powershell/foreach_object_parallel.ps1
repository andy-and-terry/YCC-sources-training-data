1..5 | ForEach-Object -Parallel { $_ * 2 } -ThrottleLimit 3 | Sort-Object
