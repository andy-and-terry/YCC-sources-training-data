Sub ArrayRedimPreserve()
    Dim a() As Long, i As Long
    ReDim a(0 To 2)
    For i = 0 To 2: a(i) = i * i: Next
    ReDim Preserve a(0 To 4)
    a(3) = 9: a(4) = 16
    For i = LBound(a) To UBound(a): Debug.Print a(i): Next
End Sub
