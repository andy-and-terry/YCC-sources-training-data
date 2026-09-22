Function LisLength(values() As Long) As Long
    Dim n As Long, i As Long, j As Long
    n = UBound(values) - LBound(values) + 1
    Dim lo As Long
    lo = LBound(values)

    Dim lengths() As Long
    ReDim lengths(lo To lo + n - 1)

    Dim best As Long
    best = 0

    For i = lo To lo + n - 1
        lengths(i) = 1
        For j = lo To i - 1
            If values(j) < values(i) And lengths(j) + 1 > lengths(i) Then
                lengths(i) = lengths(j) + 1
            End If
        Next j
        If lengths(i) > best Then best = lengths(i)
    Next i

    LisLength = best
End Function

Sub Main()
    Dim data(6) As Long
    data(0) = 10: data(1) = 9: data(2) = 2: data(3) = 5
    data(4) = 3: data(5) = 7: data(6) = 101

    Debug.Print LisLength(data)
End Sub
