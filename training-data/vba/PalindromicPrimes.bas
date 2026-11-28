Function IsPrime(ByVal n As Long) As Boolean
    Dim i As Long
    If n < 2 Then Exit Function
    IsPrime = True
    For i = 2 To Int(Sqr(n))
        If n Mod i = 0 Then
            IsPrime = False
            Exit Function
        End If
    Next i
End Function

Function IsPalindrome(ByVal n As Long) As Boolean
    IsPalindrome = (CStr(n) = StrReverse(CStr(n)))
End Function

Sub ShowPalindromicPrimes()
    Dim n As Long, out As String
    For n = 2 To 199
        If IsPalindrome(n) And IsPrime(n) Then out = out & n & " "
    Next n
    Debug.Print out ' 2 3 5 7 11 101 131 151 181 191
End Sub
