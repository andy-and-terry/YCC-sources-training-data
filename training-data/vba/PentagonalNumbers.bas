' Pentagonal numbers: n(3n-1)/2.
Public Sub Main()
    Dim n As Long, out As String
    For n = 1 To 10
        out = out & (n * (3 * n - 1) \ 2) & " "
    Next n
    Debug.Print out
End Sub
