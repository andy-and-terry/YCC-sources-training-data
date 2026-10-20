Sub StringFunctionsTour()
    Dim s As String: s = "Hello, World"
    Debug.Print Len(s), UCase(s), LCase(s), Left(s, 5), Right(s, 5), Mid(s, 8, 3)
    Debug.Print InStr(s, "o"), InStrRev(s, "o"), Replace(s, "l", "L"), StrReverse(s)
    Debug.Print Trim("  pad  ") & "|", LTrim("  x") & "|", RTrim("x  ") & "|"
    Debug.Print String(3, "*"), Space(2) & "|", Format(3.14159, "0.00"), Format(1234567.891, "#,##0.00")
    Debug.Print Format(Date, "yyyy") >= "2024", Chr(65), Asc("a"), CStr(42) & "!", Val("12abc")
    Dim parts() As String: parts = Split("a,b,,c", ",")
    Debug.Print UBound(parts) + 1, Join(parts, "-")
    Debug.Print StrComp("a", "A", vbTextCompare), "abc" Like "a*c", "abc" Like "a?c", "x1" Like "[a-z]#"
    Debug.Print UCase(Left(s, 1)) & LCase(Mid(s, 2)), Format(0.256, "Percent"), Format(5, "000")
End Sub
