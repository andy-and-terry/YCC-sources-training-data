Private Function IsPrime(ByVal n As Long) As Boolean
    Dim i As Long
    If n < 2 Then IsPrime = False: Exit Function
    For i = 2 To CLng(Sqr(n))
        If n Mod i = 0 Then IsPrime = False: Exit Function
    Next i
    IsPrime = True
End Function

Sub PrintTwinPrimes()
    Dim p As Long, s As String
    For p = 3 To 78
        If IsPrime(p) And IsPrime(p + 2) Then s = s & "(" & p & "," & (p + 2) & ") "
    Next p
    Debug.Print s ' (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
End Sub
