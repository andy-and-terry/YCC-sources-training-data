Function IsIsogram(ByVal s As String) As Boolean
    Dim seen As String, i As Long, c As String
    s = LCase$(s)
    For i = 1 To Len(s)
        c = Mid$(s, i, 1)
        If c Like "[a-z]" Then
            If InStr(seen, c) > 0 Then Exit Function
            seen = seen & c
        End If
    Next i
    IsIsogram = True
End Function

Function IsPangram(ByVal s As String) As Boolean
    Dim ch As Long
    s = LCase$(s)
    For ch = Asc("a") To Asc("z")
        If InStr(s, Chr$(ch)) = 0 Then Exit Function
    Next ch
    IsPangram = True
End Function

Sub Main()
    Debug.Print IsIsogram("lumberjacks"), IsIsogram("programming")
    Debug.Print IsPangram("The quick brown fox jumps over the lazy dog"), IsPangram("Hello")
End Sub
