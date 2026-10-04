Sub Main()
    Dim d As Date
    d = DateSerial(2024, 2, 28)

    Debug.Print Format(d, "yyyy-mm-dd")
    Debug.Print Format(DateAdd("d", 2, d), "yyyy-mm-dd")
    Debug.Print Format(DateAdd("m", 1, d), "yyyy-mm-dd")
    Debug.Print DateDiff("d", d, DateSerial(2024, 12, 25))
    Debug.Print Year(d) & "/" & Month(d) & "/" & Day(d)
    Debug.Print Weekday(d, vbMonday)
    Debug.Print Format(d, "dddd")
    Debug.Print MonthName(Month(d))
    Debug.Print IsDate("2024-13-45")
    Debug.Print Day(DateSerial(2024, 3, 0)) & " days in Feb 2024"
End Sub
