Function IsArmstrong(ByVal n As Long) As Boolean
    Dim s As String, i As Long, total As Long
    s = CStr(n)
    For i = 1 To Len(s)
        total = total + CLng(Mid$(s, i, 1)) ^ Len(s)
    Next i
    IsArmstrong = (total = n)
End Function

Sub ShowArmstrong()
    Dim n As Long, out As String
    For n = 1 To 999
        If IsArmstrong(n) Then out = out & n & " "
    Next n
    Debug.Print out ' 1..9 153 370 371 407
End Sub
