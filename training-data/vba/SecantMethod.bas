Function F(x As Double) As Double
    F = x * x - 2
End Function

Function Secant(a As Double, b As Double) As Double
    Dim i As Long, c As Double
    For i = 1 To 40
        If F(b) = F(a) Then Exit For
        c = b - F(b) * (b - a) / (F(b) - F(a))
        a = b: b = c
    Next i
    Secant = b
End Function
