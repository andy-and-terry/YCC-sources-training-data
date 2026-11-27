Private Function IsPrime(ByVal n As Long) As Boolean
    Dim i As Long
    If n < 2 Then Exit Function
    IsPrime = True
    For i = 2 To Int(Sqr(n))
        If n Mod i = 0 Then IsPrime = False: Exit Function
    Next i
End Function

Private Function Rev(ByVal n As Long) As Long
    Rev = CLng(StrReverse(CStr(n)))
End Function

Public Sub Main()
    Dim p As Long, out As String
    For p = 2 To 99
        If IsPrime(p) And Rev(p) <> p Then
            If IsPrime(Rev(p)) Then out = out & p & " "
        End If
    Next p
    Debug.Print out
End Sub
