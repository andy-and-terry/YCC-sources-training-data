Function PrimeFactorCount(ByVal n As Long) As Long
    Dim p As Long, count As Long
    p = 2
    Do While p * p <= n
        Do While n Mod p = 0
            n = n \ p
            count = count + 1
        Loop
        p = p + 1
    Loop
    If n > 1 Then count = count + 1
    PrimeFactorCount = count
End Function

Sub Main()
    Dim n As Long
    For n = 2 To 29
        If PrimeFactorCount(n) = 2 Then Debug.Print n
    Next n
End Sub
