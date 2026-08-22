Function IsPrime(ByVal n As Long) As Boolean
    Dim i As Long
    If n < 2 Then
        IsPrime = False
        Exit Function
    End If
    For i = 2 To Int(Sqr(n))
        If n Mod i = 0 Then
            IsPrime = False
            Exit Function
        End If
    Next i
    IsPrime = True
End Function

Sub Main()
    Dim n As Long
    For n = 2 To 20
        If IsPrime(n) Then
            Debug.Print n
        End If
    Next n
End Sub
