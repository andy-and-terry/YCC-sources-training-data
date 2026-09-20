Sub Dijkstra()
    Const numNodes As Integer = 5
    Const INF As Long = 2147483647

    ' adjacency(u, v) = weight, or INF if no edge
    Dim adjacency(0 To numNodes - 1, 0 To numNodes - 1) As Long
    Dim i As Integer, j As Integer
    For i = 0 To numNodes - 1
        For j = 0 To numNodes - 1
            adjacency(i, j) = INF
        Next j
    Next i

    adjacency(0, 1) = 4
    adjacency(0, 2) = 1
    adjacency(2, 1) = 2
    adjacency(1, 3) = 1
    adjacency(2, 3) = 5
    adjacency(3, 4) = 3

    Dim dist(0 To numNodes - 1) As Long
    Dim visited(0 To numNodes - 1) As Boolean
    For i = 0 To numNodes - 1
        dist(i) = INF
        visited(i) = False
    Next i
    dist(0) = 0

    Dim count As Integer
    For count = 0 To numNodes - 1
        Dim u As Integer
        u = -1
        For i = 0 To numNodes - 1
            If Not visited(i) Then
                If u = -1 Or dist(i) < dist(u) Then
                    u = i
                End If
            End If
        Next i

        If u = -1 Or dist(u) = INF Then Exit For
        visited(u) = True

        For j = 0 To numNodes - 1
            If adjacency(u, j) < INF Then
                If dist(u) + adjacency(u, j) < dist(j) Then
                    dist(j) = dist(u) + adjacency(u, j)
                End If
            End If
        Next j
    Next count

    For i = 0 To numNodes - 1
        Debug.Print i, dist(i)
    Next i
End Sub

Sub Main()
    Dijkstra
End Sub
