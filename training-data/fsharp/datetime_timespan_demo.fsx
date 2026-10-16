open System

let start = DateTime(2024, 2, 28)
let later = start.AddDays 2.0
printfn "%s" (later.ToString "yyyy-MM-dd")
printfn "%A" later.DayOfWeek
printfn "leap year: %b" (DateTime.IsLeapYear 2024)
printfn "days in Feb: %d" (DateTime.DaysInMonth(2024, 2))

let span = DateTime(2024, 12, 25) - DateTime(2024, 1, 1)
printfn "days between: %d" span.Days
printfn "hours: %.0f" span.TotalHours

let t = TimeSpan.FromMinutes 135.0
printfn "%d h %d m" t.Hours t.Minutes
printfn "%s" (t.ToString @"hh\:mm")
