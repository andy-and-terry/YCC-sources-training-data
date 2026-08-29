Function EditDistance(a As String, b As String) As Long
    Dim m As Long, n As Long
    m = Len(a)
    n = Len(b)
    Dim table(100, 100) As Long
    Dim i As Long, j As Long, cost As Long
    For i = 0 To m
        table(i, 0) = i
    Next i
    For j = 0 To n
        table(0, j) = j
    Next j
    For i = 1 To m
        For j = 1 To n
            If Mid(a, i, 1) = Mid(b, j, 1) Then
                cost = 0
            Else
                cost = 1
            End If
            table(i, j) = table(i - 1, j) + 1
            If table(i, j - 1) + 1 < table(i, j) Then table(i, j) = table(i, j - 1) + 1
            If table(i - 1, j - 1) + cost < table(i, j) Then table(i, j) = table(i - 1, j - 1) + cost
        Next j
    Next i
    EditDistance = table(m, n)
End Function

Sub Main()
    Debug.Print EditDistance("kitten", "sitting")
End Sub
