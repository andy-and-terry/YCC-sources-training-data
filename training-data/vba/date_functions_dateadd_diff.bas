Sub DateDemo()
    Dim d As Date: d = DateSerial(2026, 11, 5)
    Debug.Print Format(d, "yyyy-mm-dd")
    Debug.Print Format(DateAdd("m", 3, d), "yyyy-mm-dd")
    Debug.Print DateDiff("d", d, DateSerial(2026, 12, 25))
    Debug.Print Weekday(d), Month(d), Year(d)
End Sub
