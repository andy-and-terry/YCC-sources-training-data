' Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
Private Function IsBouncy(ByVal n As Long) As Boolean
    Dim s As String, i As Long, inc As Boolean, dec As Boolean
    s = CStr(n)
    inc = True
    dec = True
    For i = 2 To Len(s)
        If Mid$(s, i - 1, 1) > Mid$(s, i, 1) Then inc = False
        If Mid$(s, i - 1, 1) < Mid$(s, i, 1) Then dec = False
    Next i
    IsBouncy = (Not inc) And (Not dec)
End Function

Public Sub BouncyNumbers()
    Dim n As Long, count As Long
    For n = 1 To 999
        If IsBouncy(n) Then count = count + 1
    Next n
    Debug.Print count
End Sub
