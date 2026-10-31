Function IsPowerful(ByVal n As Long) As Boolean
    Dim p As Long
    p = 2
    Do While p * p <= n
        If n Mod p = 0 Then
            If n Mod (p * p) <> 0 Then Exit Function
            Do While n Mod p = 0
                n = n \ p
            Loop
        End If
        p = p + 1
    Loop
    IsPowerful = (n = 1)
End Function

Sub Main()
    Dim n As Long
    For n = 1 To 100
        If IsPowerful(n) Then Debug.Print n
    Next n
End Sub
