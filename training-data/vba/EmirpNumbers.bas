' Emirps: primes whose digit reversal is a different prime.
Private Function IsPrime(ByVal n As Long) As Boolean
    Dim i As Long
    If n < 2 Then Exit Function
    i = 2
    Do While i * i <= n
        If n Mod i = 0 Then Exit Function
        i = i + 1
    Loop
    IsPrime = True
End Function

Private Function ReverseDigits(ByVal n As Long) As Long
    ReverseDigits = CLng(StrReverse(CStr(n)))
End Function

Public Sub PrintEmirps()
    Dim n As Long, r As Long, out As String
    For n = 2 To 99
        r = ReverseDigits(n)
        If r <> n Then
            If IsPrime(n) And IsPrime(r) Then out = out & n & " "
        End If
    Next n
    Debug.Print Trim$(out)
End Sub
