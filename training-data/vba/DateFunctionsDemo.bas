Sub Main()
    Dim d As Date
    d = DateSerial(2024, 2, 28)

    Debug.Print Format$(d, "yyyy-mm-dd")
    Debug.Print Format$(DateAdd("d", 2, d), "yyyy-mm-dd dddd")
    Debug.Print DateAdd("m", 1, d)
    Debug.Print DateDiff("d", d, DateSerial(2024, 12, 25))
    Debug.Print Year(d); Month(d); Day(d)
    Debug.Print Weekday(d, vbMonday)
    Debug.Print DatePart("q", d)
    Debug.Print MonthName(Month(d))
    Debug.Print Format$(TimeSerial(13, 5, 9), "hh:nn:ss AM/PM")
    Debug.Print IsDate("2024-13-45")
End Sub
