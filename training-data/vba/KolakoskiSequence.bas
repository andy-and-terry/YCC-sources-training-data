Sub Main()
    Dim a(0 To 25) As Long
    Dim w As Long, r As Long, v As Long, k As Long, i As Long
    Dim result As String
    a(0) = 1: a(1) = 2: a(2) = 2
    w = 3: r = 2: v = 1
    Do While w < 20
        For k = 1 To a(r)
            a(w) = v
            w = w + 1
        Next k
        v = 3 - v
        r = r + 1
    Loop
    result = CStr(a(0))
    For i = 1 To 19
        result = result & " " & a(i)
    Next i
    Debug.Print result
End Sub
