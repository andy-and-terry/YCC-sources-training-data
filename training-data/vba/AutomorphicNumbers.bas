Function IsAutomorphic(ByVal n As Long) As Boolean
    Dim sq As String, s As String
    sq = CStr(CDbl(n) * CDbl(n))
    s = CStr(n)
    IsAutomorphic = (Right$(sq, Len(s)) = s)
End Function

Sub ShowAutomorphic()
    Dim n As Long, out As String
    For n = 0 To 999
        If IsAutomorphic(n) Then out = out & n & " "
    Next n
    Debug.Print out ' 0 1 5 6 25 76 376 625
End Sub
