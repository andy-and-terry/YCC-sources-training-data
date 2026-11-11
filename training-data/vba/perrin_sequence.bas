' Perrin sequence P(n)=P(n-2)+P(n-3)
Sub Main()
    Dim v(0 To 9) As Long, i As Long, out As String
    v(0) = 3: v(1) = 0: v(2) = 2
    For i = 3 To 9
        v(i) = v(i - 2) + v(i - 3)
    Next i
    For i = 0 To 9
        out = out & v(i) & " "
    Next i
    Debug.Print out
End Sub
