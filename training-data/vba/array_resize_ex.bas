Sub ArrayDemo()
    Dim a() As Integer
    ReDim a(1 To 3)
    Dim i As Long
    For i = 1 To 3: a(i) = i * i: Next i
    ReDim Preserve a(1 To 5)
    a(4) = 16: a(5) = 25
    For i = LBound(a) To UBound(a)
        Debug.Print a(i);
    Next i
End Sub
