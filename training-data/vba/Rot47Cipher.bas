Function Rot47(s As String) As String
    Dim i As Long, n As Long, out As String
    For i = 1 To Len(s)
        n = Asc(Mid$(s, i, 1))
        If n >= 33 And n <= 126 Then n = 33 + (n - 33 + 47) Mod 94
        out = out & Chr$(n)
    Next i
    Rot47 = out
End Function
