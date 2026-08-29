function Test-LeapYear {
    param([int]$Year)

    return (($Year % 4 -eq 0) -and ($Year % 100 -ne 0)) -or ($Year % 400 -eq 0)
}

Test-LeapYear -Year 2000
Test-LeapYear -Year 1900
Test-LeapYear -Year 2024
