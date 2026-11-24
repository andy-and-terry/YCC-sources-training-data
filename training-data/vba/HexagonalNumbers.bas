' Hexagonal numbers: n(2n-1).
Public Sub Main()
    Dim n As Long, out As String
    For n = 1 To 10
        out = out & (n * (2 * n - 1)) & " "
    Next n
    Debug.Print out
End Sub
