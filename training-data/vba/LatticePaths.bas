' Lattice paths with a DP row.
Public Function LatticePaths(n As Long) As Double
    Dim row() As Double, i As Long, j As Long, k As Long
    ReDim row(0 To n)
    For i = 0 To n: row(i) = 1: Next i
    For k = 1 To n
        For j = 1 To n
            row(j) = row(j) + row(j - 1)
        Next j
    Next k
    LatticePaths = row(n)
End Function
