' Disarium numbers: digits raised to their 1-based positions sum to n.
Private Function IsDisarium(ByVal n As Long) As Boolean
    Dim s As String, i As Long, total As Long
    s = CStr(n)
    For i = 1 To Len(s)
        total = total + CLng(Mid$(s, i, 1)) ^ i
    Next i
    IsDisarium = (total = n)
End Function

Public Sub DisariumNumbers()
    Dim n As Long, out As String
    For n = 1 To 999
        If IsDisarium(n) Then out = out & n & " "
    Next n
    Debug.Print Trim$(out)
End Sub
