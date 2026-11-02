Sub StringFunctions()
    Dim s As String: s = "  Hello VBA  "
    Debug.Print Trim(s), Len(Trim(s)), UCase(Trim(s))
    Debug.Print Mid(Trim(s), 7, 3), InStr(s, "VBA")
End Sub
