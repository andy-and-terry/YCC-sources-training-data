' Wilson's theorem primality test.
Public Function WilsonIsPrime(n As Long) As Boolean
    Dim f As Double, i As Long
    If n < 2 Then Exit Function
    f = 1
    For i = 2 To n - 1
        f = (f * i) - Int((f * i) / n) * n
    Next i
    WilsonIsPrime = (f = n - 1)
End Function
