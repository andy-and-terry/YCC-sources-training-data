Private Function Sigma(ByVal n As Long) As Long
    Dim d As Long, s As Long
    For d = 1 To n
        If n Mod d = 0 Then s = s + d
    Next d
    Sigma = s
End Function

Sub PrintSuperperfect()
    Dim n As Long, s As String
    For n = 1 To 99
        If Sigma(Sigma(n)) = 2 * n Then s = s & n & " "
    Next n
    Debug.Print s ' 2 4 16 64
End Sub
