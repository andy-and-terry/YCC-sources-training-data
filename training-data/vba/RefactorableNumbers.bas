Private Function Tau(ByVal n As Long) As Long
    Dim d As Long, c As Long
    For d = 1 To n
        If n Mod d = 0 Then c = c + 1
    Next d
    Tau = c
End Function

Sub PrintRefactorable()
    Dim n As Long, s As String
    For n = 1 To 59
        If n Mod Tau(n) = 0 Then s = s & n & " "
    Next n
    Debug.Print s ' 1 2 8 9 12 18 24 36 40 56
End Sub
