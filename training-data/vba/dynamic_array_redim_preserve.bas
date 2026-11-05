Sub GrowArray()
    Dim a() As Long
    Dim i As Long
    ReDim a(0 To 2)
    For i = 0 To 2: a(i) = i * 10: Next i
    ReDim Preserve a(0 To 4)
    a(3) = 30: a(4) = 40
    For i = LBound(a) To UBound(a)
        Debug.Print a(i)
    Next i
End Sub
