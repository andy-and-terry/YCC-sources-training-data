Private Function IsPrime(ByVal n As Long) As Boolean
    Dim i As Long
    If n < 2 Then IsPrime = False: Exit Function
    For i = 2 To CLng(Sqr(n))
        If n Mod i = 0 Then IsPrime = False: Exit Function
    Next i
    IsPrime = True
End Function

Private Function ReverseDigits(ByVal n As Long) As Long
    Dim r As Long
    Do While n > 0
        r = r * 10 + n Mod 10
        n = n \ 10
    Loop
    ReverseDigits = r
End Function

Sub PrintEmirps()
    Dim n As Long, r As Long, count As Long, s As String
    n = 2
    Do While count < 10
        r = ReverseDigits(n)
        If r <> n And IsPrime(n) And IsPrime(r) Then s = s & n & " ": count = count + 1
        n = n + 1
    Loop
    Debug.Print s ' 13 17 31 37 71 73 79 97 107 113
End Sub
