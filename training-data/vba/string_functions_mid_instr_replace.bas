Sub StringDemo()
    Dim s As String
    s = "Hello, World"
    Debug.Print UCase(s), LCase(s), Len(s)
    Debug.Print Mid(s, 8, 5), Left(s, 5), Right(s, 5)
    Debug.Print InStr(s, "World"), Replace(s, "World", "VBA")
    Debug.Print Trim("  padded  ") & "|"
End Sub
