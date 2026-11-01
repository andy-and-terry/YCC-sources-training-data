Sub StringDemo()
    Dim s As String: s = "  Hello, VBA  "
    Debug.Print UCase(Trim(s)), Len(s)
    Debug.Print Mid(s, 3, 5), Left(Trim(s), 5), Right(Trim(s), 3)
    Debug.Print InStr(s, "VBA"), Replace(s, "l", "L")
    Debug.Print Join(Split("a,b,c", ","), "|")
    Debug.Print Format(1234.5, "#,##0.00"), Format(Date, "yyyy-mm-dd")
End Sub
