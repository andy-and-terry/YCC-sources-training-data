Sub Demo()
    Dim a() As Integer, i As Long
    ReDim a(1 To 3)
    For i = 1 To 3: a(i) = i * i: Next i
    ReDim Preserve a(1 To 5)
    a(4) = 16: a(5) = 25
    Debug.Print LBound(a), UBound(a)
End Sub
