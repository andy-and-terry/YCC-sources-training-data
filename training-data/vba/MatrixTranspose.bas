Function Transpose2D(m() As Long) As Long()
    Dim r As Long, c As Long
    Dim t() As Long
    ReDim t(LBound(m, 2) To UBound(m, 2), LBound(m, 1) To UBound(m, 1))
    For r = LBound(m, 1) To UBound(m, 1)
        For c = LBound(m, 2) To UBound(m, 2)
            t(c, r) = m(r, c)
        Next c
    Next r
    Transpose2D = t
End Function

Sub Main()
    Dim m(1, 2) As Long
    m(0, 0) = 1: m(0, 1) = 2: m(0, 2) = 3
    m(1, 0) = 4: m(1, 1) = 5: m(1, 2) = 6
    Dim t() As Long
    t = Transpose2D(m)
    Dim r As Long, c As Long, line As String
    For r = 0 To UBound(t, 1)
        line = ""
        For c = 0 To UBound(t, 2)
            line = line & t(r, c) & " "
        Next c
        Debug.Print line
    Next r
End Sub
