Private Function F(ByVal x As Double) As Double
    F = x * x - 2
End Function

Public Function Secant(ByVal x0 As Double, ByVal x1 As Double) As Double
    Dim i As Long, f0 As Double, f1 As Double, nx As Double
    For i = 1 To 50
        f0 = F(x0): f1 = F(x1)
        If f1 = f0 Then Exit For
        nx = x1 - f1 * (x1 - x0) / (f1 - f0)
        x0 = x1: x1 = nx
        If Abs(x1 - x0) < 0.000000000001 Then Exit For
    Next i
    Secant = x1
End Function

Public Sub Main()
    Debug.Print Format$(Secant(1, 2), "0.0000000000")
End Sub
