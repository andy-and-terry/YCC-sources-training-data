' Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
Public Sub LazyCatererNumbers()
    Dim n As Long, out As String
    For n = 0 To 9
        out = out & (n * (n + 1) \ 2 + 1) & " "
    Next n
    Debug.Print Trim$(out)
End Sub
