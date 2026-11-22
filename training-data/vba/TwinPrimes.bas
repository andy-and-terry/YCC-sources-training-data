' Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
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

Public Sub TwinPrimes()
    Dim p As Long, out As String
    For p = 2 To 99
        If IsPrime(p) And IsPrime(p + 2) Then out = out & p & " "
    Next p
    Debug.Print Trim$(out)
End Sub
