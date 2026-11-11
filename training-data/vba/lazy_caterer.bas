' Lazy caterer sequence: max pieces from n cuts
Function Term(n As Long) As Long
    Term = ((n * (n + 1)) \ 2) + 1
End Function

Sub Main()
    Dim n As Long, out As String
    For n = 0 To 9
        out = out & Term(n) & " "
    Next n
    Debug.Print out
End Sub
