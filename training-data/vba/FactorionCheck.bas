Function IsFactorion(n As Long) As Boolean
    Dim fact As Variant, m As Long, total As Long
    fact = Array(1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880)
    m = n
    Do While m > 0
        total = total + fact(m Mod 10)
        m = m \ 10
    Loop
    IsFactorion = (total = n)
End Function

Sub Main()
    Dim n As Long
    For n = 1 To 49999
        If IsFactorion(n) Then Debug.Print n
    Next n
End Sub
