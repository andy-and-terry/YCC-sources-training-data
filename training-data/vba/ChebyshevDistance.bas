Function Chebyshev(a As Variant, b As Variant) As Long
    Dim i As Long, d As Long
    For i = LBound(a) To UBound(a)
        d = Abs(a(i) - b(i))
        If d > Chebyshev Then Chebyshev = d
    Next i
End Function

Sub Demo()
    Debug.Print Chebyshev(Array(1, 2), Array(4, 6))
End Sub
