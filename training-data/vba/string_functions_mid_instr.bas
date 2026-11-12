Sub Demo()
    Dim s As String: s = "Hello World"
    Debug.Print Left(s, 5), Mid(s, 7), InStr(s, "o"), UCase(s), Len(s)
    Debug.Print Replace(s, "o", "0"), Join(Split("a,b,c", ","), "-")
End Sub
