Sub Main()
    Dim n As Long, a As Long, b As Long, c As Long, d As Long
    Dim k As Long, e As Long, f As Long, result As String
    n = 5
    a = 0: b = 1: c = 1: d = n
    Do
        result = result & a & "/" & b & " "
        If a = 1 And b = 1 Then Exit Do
        k = (n + b) \ d
        e = k * c - a
        f = k * d - b
        a = c: b = d: c = e: d = f
    Loop
    Debug.Print result
End Sub
