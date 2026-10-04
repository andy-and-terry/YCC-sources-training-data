Sub Main()
    Dim d As Date
    d = DateSerial(2024, 2, 28)

    Debug.Print Format(d, "yyyy-mm-dd")
    Debug.Print Format(DateAdd("d", 2, d), "yyyy-mm-dd")
    Debug.Print Format(DateAdd("m", 1, d), "yyyy-mm-dd")
    Debug.Print Year(d); Month(d); Day(d)
    Debug.Print "weekday: "; Weekday(d, vbMonday)
    Debug.Print "name: "; Format(d, "dddd")
    Debug.Print "diff days: "; DateDiff("d", d, DateSerial(2024, 12, 25))
    Debug.Print "weeks: "; DateDiff("ww", d, DateSerial(2024, 12, 25))
    Debug.Print "part q: "; DatePart("q", d)
    Debug.Print "is date: "; IsDate("2024-13-45"); IsDate("2024-06-01")
    Debug.Print "last day of Feb: "; Day(DateSerial(2024, 3, 0))
End Sub
