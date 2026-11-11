' Tetrahedral numbers n(n+1)(n+2)/6
Function Term(n As Long) As Long
    Term = ((n * (n + 1)) * (n + 2)) \ 6
End Function

Sub Main()
    Dim n As Long, out As String
    For n = 0 To 9
        out = out & Term(n) & " "
    Next n
    Debug.Print out
End Sub
