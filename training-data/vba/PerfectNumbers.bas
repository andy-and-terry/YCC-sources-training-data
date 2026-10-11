Function IsPerfect(ByVal n As Long) As Boolean
    Dim i As Long, total As Long
    If n < 2 Then Exit Function
    total = 1
    For i = 2 To Int(Sqr(n))
        If n Mod i = 0 Then
            total = total + i
            If i <> n \ i Then total = total + n \ i
        End If
    Next i
    IsPerfect = (total = n)
End Function

Sub Main()
    Dim n As Long
    For n = 2 To 10000
        If IsPerfect(n) Then Debug.Print n & " is perfect"
    Next n
End Sub
