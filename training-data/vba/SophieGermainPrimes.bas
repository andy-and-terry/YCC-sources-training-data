' Sophie Germain primes: p prime and 2p + 1 prime.
Private Function IsPrime(ByVal n As Long) As Boolean
    Dim d As Long
    If n < 2 Then Exit Function
    d = 2
    Do While d * d <= n
        If n Mod d = 0 Then Exit Function
        d = d + 1
    Loop
    IsPrime = True
End Function

Public Sub SophieGermainPrimes()
    Dim p As Long, out As String
    For p = 2 To 99
        If IsPrime(p) And IsPrime(2 * p + 1) Then out = out & p & " "
    Next p
    Debug.Print Trim$(out)
End Sub
