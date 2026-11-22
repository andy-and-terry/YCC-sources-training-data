' Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
Public Sub RepunitNumbers()
    Dim r As Double, i As Long, out As String
    For i = 1 To 8
        r = r * 10 + 1
        out = out & Format$(r, "0") & " "
    Next i
    Debug.Print Trim$(out)
End Sub
