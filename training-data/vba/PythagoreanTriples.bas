Option Explicit

Sub PythagoreanTriples()
    Dim a As Long, b As Long, c As Long
    Const LIMIT As Long = 20
    For a = 1 To LIMIT - 1
        For b = a To LIMIT - 1
            c = CLng(Sqr(a * a + b * b))
            If c <= LIMIT And c * c = a * a + b * b Then
                Debug.Print a & "^2 + " & b & "^2 = " & c & "^2"
            End If
        Next b
    Next a
End Sub
