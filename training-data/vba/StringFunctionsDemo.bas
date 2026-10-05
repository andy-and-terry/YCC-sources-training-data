Sub Main()
    Dim s As String
    s = "Hello, VBA World"

    Debug.Print Len(s)
    Debug.Print Left(s, 5)
    Debug.Print Right(s, 5)
    Debug.Print Mid(s, 8, 3)
    Debug.Print InStr(s, "VBA")
    Debug.Print InStrRev(s, "o")
    Debug.Print UCase(s)
    Debug.Print LCase(s)
    Debug.Print Replace(s, "World", "There")
    Debug.Print "[" & Trim("   padded   ") & "]"
    Debug.Print StrReverse("abc")
    Debug.Print String(5, "*")
    Debug.Print Space(3) & "|"
    Debug.Print Asc("A"), Chr(66)
    Debug.Print StrComp("apple", "Apple", vbTextCompare)
    Debug.Print Format(1234.5, "#,##0.00")
End Sub
