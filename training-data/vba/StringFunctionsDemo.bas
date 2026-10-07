Sub Main()
    Dim s As String
    s = "Hello, VBA World"

    Debug.Print Len(s)
    Debug.Print Left$(s, 5)
    Debug.Print Right$(s, 5)
    Debug.Print Mid$(s, 8, 3)
    Debug.Print InStr(s, "VBA")
    Debug.Print InStrRev(s, "o")
    Debug.Print UCase$(s); " / "; LCase$(s)
    Debug.Print Replace(s, "World", "There")
    Debug.Print StrReverse(s)
    Debug.Print Trim$("  padded  ") & "|"
    Debug.Print String(3, "*") & Space(2) & "end"
    Debug.Print Asc("A"); Chr$(66)
    Debug.Print StrComp("a", "A", vbTextCompare)

    Mid$(s, 1, 5) = "HELLO"
    Debug.Print s
End Sub
