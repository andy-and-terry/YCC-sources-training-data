' Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
Private Function IsKeith(ByVal n As Long) As Boolean
    Dim seq(1 To 64) As Long
    Dim s As String, k As Long, length As Long, i As Long, total As Long
    s = CStr(n)
    k = Len(s)
    For i = 1 To k
        seq(i) = CLng(Mid$(s, i, 1))
    Next i
    length = k
    Do While seq(length) < n
        total = 0
        For i = length - k + 1 To length
            total = total + seq(i)
        Next i
        length = length + 1
        seq(length) = total
    Loop
    IsKeith = (seq(length) = n)
End Function

Public Sub KeithNumbers()
    Dim n As Long, out As String
    For n = 10 To 1199
        If IsKeith(n) Then out = out & n & " "
    Next n
    Debug.Print Trim$(out)
End Sub
