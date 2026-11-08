Function DeltaEncode(xs As Variant) As Variant
    Dim d() As Long, i As Long
    ReDim d(LBound(xs) To UBound(xs))
    d(LBound(xs)) = xs(LBound(xs))
    For i = LBound(xs) + 1 To UBound(xs)
        d(i) = xs(i) - xs(i - 1)
    Next i
    DeltaEncode = d
End Function
