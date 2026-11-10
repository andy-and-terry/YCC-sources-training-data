Private Function IsPrime(ByVal n As Long) As Boolean
    Dim i As Long
    If n < 2 Then IsPrime = False: Exit Function
    For i = 2 To CLng(Sqr(n))
        If n Mod i = 0 Then IsPrime = False: Exit Function
    Next i
    IsPrime = True
End Function

Sub PrintSophieGermainPrimes()
    Dim p As Long, count As Long, s As String
    p = 2
    Do While count < 10
        If IsPrime(p) And IsPrime(2 * p + 1) Then s = s & p & " ": count = count + 1
        p = p + 1
    Loop
    Debug.Print s ' 2 3 5 11 23 29 41 53 83 89
End Sub
