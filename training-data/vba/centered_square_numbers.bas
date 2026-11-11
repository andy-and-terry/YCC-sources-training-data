' Centered square numbers 2n(n+1)+1
Function Term(n As Long) As Long
    Term = ((2 * n) * (n + 1)) + 1
End Function

Sub Main()
    Dim n As Long, out As String
    For n = 0 To 9
        out = out & Term(n) & " "
    Next n
    Debug.Print out
End Sub
