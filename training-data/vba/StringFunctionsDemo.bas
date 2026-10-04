Sub Main()
    Dim s As String
    s = "  Hello, VBA World  "

    Debug.Print "[" & Trim(s) & "]"
    Debug.Print "[" & LTrim(s) & "]"
    Debug.Print Len(s)
    Debug.Print UCase(Trim(s)); " / "; LCase(Trim(s))
    Debug.Print Left(Trim(s), 5); "|"; Right(Trim(s), 5); "|"; Mid(Trim(s), 8, 3)
    Debug.Print InStr(s, "VBA"); InStr(1, s, "vba", vbTextCompare); InStrRev(s, "o")
    Debug.Print Replace(s, "l", "L", , 2)
    Debug.Print StrReverse("stressed")
    Debug.Print String(5, "*"); Space(3); "end"
    Debug.Print Asc("A"); Chr(66); Chr(Asc("a") + 2)
    Debug.Print StrComp("apple", "Apple", vbTextCompare)
    Debug.Print Format(1234.5, "#,##0.00"); " "; Format(0.256, "0.0%")
End Sub
