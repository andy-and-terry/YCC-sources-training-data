Private Function Pieces(ByVal cuts As Long) As Long
    Pieces = (cuts * cuts + cuts + 2) \ 2
End Function

Sub PrintLazyCaterer()
    Dim n As Long, s As String
    For n = 0 To 9
        s = s & Pieces(n) & " "
    Next n
    Debug.Print s ' 1 2 4 7 11 16 22 29 37 46
End Sub
