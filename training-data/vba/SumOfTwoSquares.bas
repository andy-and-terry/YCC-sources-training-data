' Positive n expressible as a*a + b*b with a, b >= 0.
Function Representable(n As Long) As Boolean
    Dim a As Long, b As Long
    For a = 0 To 6
        For b = a To 6
            If a * a + b * b = n Then Representable = True
        Next b
    Next a
End Function

Sub PrintRepresentable()
    Dim n As Long, out As String
    For n = 1 To 30
        If Representable(n) Then out = out & n & " "
    Next n
    Debug.Print Trim(out)
End Sub
