' Centered square numbers: n^2 + (n+1)^2.
Public Sub Main()
    Dim n As Long, out As String
    For n = 0 To 9
        out = out & (n * n + (n + 1) * (n + 1)) & " "
    Next n
    Debug.Print out
End Sub
