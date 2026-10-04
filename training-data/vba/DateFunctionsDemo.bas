Sub Main()
    Dim d As Date
    d = DateSerial(2024, 2, 28)

    Debug.Print "Year/Month/Day:", Year(d), Month(d), Day(d)
    Debug.Print "Next day:", Format$(DateAdd("d", 1, d), "yyyy-mm-dd")
    Debug.Print "Two days:", Format$(DateAdd("d", 2, d), "yyyy-mm-dd")
    Debug.Print "Plus 1 month:", Format$(DateAdd("m", 1, d), "yyyy-mm-dd")
    Debug.Print "Minus 1 year:", Format$(DateAdd("yyyy", -1, d), "yyyy-mm-dd")

    Dim a As Date, b As Date
    a = DateSerial(2024, 1, 1)
    b = DateSerial(2024, 12, 25)
    Debug.Print "Days between:", DateDiff("d", a, b)
    Debug.Print "Weeks between:", DateDiff("ww", a, b)
    Debug.Print "Months between:", DateDiff("m", a, b)

    Debug.Print "Weekday of 2024-02-28:", Weekday(d), WeekdayName(Weekday(d))
    Debug.Print "Month name:", MonthName(Month(d))
    Debug.Print "Quarter part:", DatePart("q", d)
    Debug.Print "Day of year:", DatePart("y", d)

    Dim lastDay As Date
    lastDay = DateSerial(2024, 3, 0)
    Debug.Print "Last day of Feb 2024:", Day(lastDay)

    Debug.Print "Parsed:", Format$(DateValue("March 5, 2025"), "dd/mm/yyyy")
    Debug.Print "Time:", Format$(TimeSerial(13, 5, 9), "hh:nn:ss AM/PM")
    Debug.Print "IsDate:", IsDate("2024-13-45"), IsDate("2024-06-15")
    Debug.Print "Format long:", Format$(d, "dddd, mmmm d, yyyy")
End Sub
