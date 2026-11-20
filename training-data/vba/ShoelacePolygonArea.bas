' Shoelace polygon area with a user-defined type.
Private Type Pt
    X As Double
    Y As Double
End Type

Public Function PolygonArea(p() As Pt) As Double
    Dim i As Long, j As Long, s As Double
    For i = LBound(p) To UBound(p)
        j = IIf(i = UBound(p), LBound(p), i + 1)
        s = s + p(i).X * p(j).Y - p(j).X * p(i).Y
    Next i
    PolygonArea = Abs(s) / 2
End Function
