Sub FloydWarshall(dist() As Long, n As Long)
    Dim k As Long, i As Long, j As Long
    For k = 0 To n - 1
        For i = 0 To n - 1
            For j = 0 To n - 1
                If dist(i, k) + dist(k, j) < dist(i, j) Then
                    dist(i, j) = dist(i, k) + dist(k, j)
                End If
            Next j
        Next i
    Next k
End Sub

Sub Main()
    Dim n As Long
    n = 4
    Dim dist(3, 3) As Long
    Dim i As Long, j As Long
    Dim inf As Long
    inf = 999999

    For i = 0 To 3
        For j = 0 To 3
            If i = j Then
                dist(i, j) = 0
            Else
                dist(i, j) = inf
            End If
        Next j
    Next i

    dist(0, 1) = 5: dist(0, 3) = 10
    dist(1, 2) = 3
    dist(2, 3) = 1

    FloydWarshall dist, n

    For i = 0 To 3
        Dim rowText As String
        rowText = ""
        For j = 0 To 3
            rowText = rowText & dist(i, j) & " "
        Next j
        Debug.Print rowText
    Next i
End Sub
