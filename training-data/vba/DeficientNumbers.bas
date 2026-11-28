Function Sigma(n As Long) As Long
    Dim d As Long
    For d = 1 To n
        If n Mod d = 0 Then Sigma = Sigma + d
    Next d
End Function

Sub Demo()
    Dim n As Long, out As String
    For n = 1 To 20
        If Sigma(n) < 2 * n Then out = out & n & " "
    Next n
    Debug.Print out
End Sub
