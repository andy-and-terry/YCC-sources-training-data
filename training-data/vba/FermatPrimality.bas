' Fermat primality test; Carmichael number 561 fools it.
Private Function PowMod(ByVal b As Double, ByVal e As Long, ByVal m As Double) As Double
    Dim r As Double
    r = 1
    b = b - Int(b / m) * m
    Do While e > 0
        If e Mod 2 = 1 Then
            r = r * b
            r = r - Int(r / m) * m
        End If
        b = b * b
        b = b - Int(b / m) * m
        e = e \ 2
    Loop
    PowMod = r
End Function

Public Function ProbablyPrime(ByVal n As Long) As Boolean
    ProbablyPrime = (n > 2) And (PowMod(2, n - 1, n) = 1)
End Function

Public Sub RunFermat()
    Dim v As Variant
    For Each v In Array(97, 91, 561)
        Debug.Print v & " " & ProbablyPrime(CLng(v))
    Next v
End Sub
