Sub Main()
    Dim d1 As Date, d2 As Date
    d1 = DateSerial(2024, 1, 15)
    d2 = DateSerial(2024, 3, 1)

    Debug.Print "Days: " & DateDiff("d", d1, d2)
    Debug.Print "Weeks: " & DateDiff("ww", d1, d2)
    Debug.Print "Months: " & DateDiff("m", d1, d2)
    Debug.Print Format$(DateAdd("m", 1, d1), "yyyy-mm-dd")
    Debug.Print Format$(DateAdd("d", 45, d1), "yyyy-mm-dd")
    Debug.Print Format$(DateAdd("yyyy", -1, d1), "yyyy-mm-dd")
    Debug.Print "Weekday: " & Format$(d1, "dddd")
    Debug.Print "Quarter: " & DatePart("q", d2)
    Debug.Print "Last day of Feb: " & Day(DateSerial(2024, 3, 0))
End Sub
