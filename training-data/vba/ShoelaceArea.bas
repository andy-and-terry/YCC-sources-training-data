Function ShoelaceArea(x As Variant, y As Variant) As Double
    Dim i As Long, j As Long, s As Double, n As Long
    n = UBound(x) - LBound(x) + 1
    For i = 0 To n - 1
        j = (i + 1) Mod n
        s = s + x(LBound(x) + i) * y(LBound(y) + j) - x(LBound(x) + j) * y(LBound(y) + i)
    Next i
    ShoelaceArea = Abs(s) / 2
End Function
