let isLeapYear year =
    (year % 4 = 0 && year % 100 <> 0) || year % 400 = 0

printfn "%b" (isLeapYear 2000)
printfn "%b" (isLeapYear 1900)
printfn "%b" (isLeapYear 2024)
