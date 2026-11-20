' Manhattan distance of two arrays.
Public Function Manhattan(a As Variant, b As Variant) As Long
    Dim i As Long
    For i = LBound(a) To UBound(a)
        Manhattan = Manhattan + Abs(a(i) - b(i))
    Next i
End Function
