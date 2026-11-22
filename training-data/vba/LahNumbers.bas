' Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
Private Function Fact(ByVal n As Long) As Double
    Dim i As Long
    Fact = 1
    For i = 2 To n
        Fact = Fact * i
    Next i
End Function

Private Function Comb(ByVal n As Long, ByVal k As Long) As Double
    Comb = Fact(n) / (Fact(k) * Fact(n - k))
End Function

Public Sub LahNumbers()
    Dim n As Long, k As Long, out As String
    n = 5
    For k = 1 To n
        out = out & Format$(Comb(n - 1, k - 1) * Fact(n) / Fact(k), "0") & " "
    Next k
    Debug.Print Trim$(out)
End Sub
