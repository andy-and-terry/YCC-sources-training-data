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

Function ReverseNumber(ByVal n As Long) As Long
    ReverseNumber = CLng(StrReverse(CStr(n)))
End Function

Sub ShowEmirps()
    Dim p As Long, out As String
    For p = 2 To 199
        If ReverseNumber(p) <> p And IsPrime(p) And IsPrime(ReverseNumber(p)) Then
            out = out & p & " "
        End If
    Next p
    Debug.Print out ' 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
End Sub
