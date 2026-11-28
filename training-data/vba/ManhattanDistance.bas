Function Manhattan(a As Variant, b As Variant) As Long
    Dim i As Long, s As Long
    For i = LBound(a) To UBound(a)
        s = s + Abs(a(i) - b(i))
    Next i
    Manhattan = s
End Function

Sub Demo()
    Debug.Print Manhattan(Array(1, 2), Array(4, 6))
End Sub
