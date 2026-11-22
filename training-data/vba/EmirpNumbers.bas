' Emirps: primes whose digit reversal is a different prime.
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

Public Sub EmirpNumbers()
    Dim n As Long, r As Long, out As String
    For n = 2 To 199
        r = CLng(StrReverse(CStr(n)))
        If r <> n And IsPrime(n) And IsPrime(r) Then out = out & n & " "
    Next n
    Debug.Print Trim$(out)
End Sub
