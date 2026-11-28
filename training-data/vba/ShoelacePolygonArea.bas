Public Function PolygonArea(xs As Variant, ys As Variant) As Double
    Dim n As Long, i As Long, j As Long, s As Double
    n = UBound(xs) - LBound(xs) + 1
    For i = 0 To n - 1
        j = (i + 1) Mod n
        s = s + xs(i) * ys(j) - xs(j) * ys(i)
    Next i
    PolygonArea = Abs(s) / 2
End Function

Public Sub Main()
    Debug.Print PolygonArea(Array(0, 4, 4, 0), Array(0, 0, 3, 3))
End Sub
