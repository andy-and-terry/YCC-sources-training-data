Sub Main()
    Dim s As String
    s = "  Hello, VBA World  "

    Debug.Print "[" & Trim(s) & "]"
    Debug.Print Len(s)
    Debug.Print UCase(Trim(s))
    Debug.Print Left(Trim(s), 5)
    Debug.Print Right(Trim(s), 5)
    Debug.Print Mid(Trim(s), 8, 3)
    Debug.Print InStr(s, "VBA")
    Debug.Print InStrRev(s, "o")
    Debug.Print Replace(s, "l", "L")
    Debug.Print StrReverse("stressed")
    Debug.Print String(5, "*")
    Debug.Print Space(3) & "|"
    Debug.Print Asc("A") & " " & Chr(66)
    Debug.Print StrComp("a", "B", vbTextCompare)
    Debug.Print Format(1234.5, "#,##0.00")
End Sub
