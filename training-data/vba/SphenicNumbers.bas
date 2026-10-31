Function IsSphenic(ByVal n As Long) As Boolean
    Dim p As Long, distinct As Long
    p = 2
    Do While p * p <= n
        If n Mod p = 0 Then
            n = n \ p
            If n Mod p = 0 Then Exit Function
            distinct = distinct + 1
        End If
        p = p + 1
    Loop
    If n > 1 Then distinct = distinct + 1
    IsSphenic = (distinct = 3)
End Function

Sub Main()
    Dim n As Long
    For n = 2 To 79
        If IsSphenic(n) Then Debug.Print n
    Next n
End Sub
