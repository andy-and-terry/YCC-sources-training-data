Sub GrowArray()
    Dim a() As Integer
    ReDim a(1 To 2)
    a(1) = 10: a(2) = 20
    ReDim Preserve a(1 To 4)
    a(3) = 30: a(4) = 40
    Dim i As Long
    For i = LBound(a) To UBound(a)
        Debug.Print a(i)
    Next i
End Sub
