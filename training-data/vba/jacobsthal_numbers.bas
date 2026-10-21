' Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
Public Sub PrintJacobsthal()
    Dim a As Long, b As Long, t As Long
    Dim i As Long, s As String
    a = 0
    b = 1
    For i = 0 To 14
        s = s & a & " "
        t = b + 2 * a
        a = b
        b = t
    Next i
    Debug.Print Trim(s)
End Sub
