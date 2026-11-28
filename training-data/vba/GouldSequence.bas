Private Function Popcount(ByVal n As Long) As Long
    Do While n > 0
        Popcount = Popcount + (n And 1)
        n = n \ 2
    Loop
End Function

Public Sub Main()
    Dim n As Long, out As String
    For n = 0 To 15
        out = out & 2 ^ Popcount(n) & " "
    Next n
    Debug.Print out
End Sub
