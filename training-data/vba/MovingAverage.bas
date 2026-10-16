Function MovingAvg(values As Variant, ByVal window As Long) As Variant
    Dim result() As Double
    Dim i As Long, j As Long, total As Double
    ReDim result(0 To UBound(values) - window + 1)
    For i = 0 To UBound(result)
        total = 0
        For j = i To i + window - 1
            total = total + values(j)
        Next j
        result(i) = total / window
    Next i
    MovingAvg = result
End Function

Sub Main()
    Dim avg As Variant, i As Long
    avg = MovingAvg(Array(1, 2, 3, 4, 5, 6), 3)
    For i = LBound(avg) To UBound(avg)
        Debug.Print Format$(avg(i), "0.00")
    Next i
End Sub
