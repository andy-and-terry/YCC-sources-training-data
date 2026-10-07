Sub Dijkstra(adjMatrix() As Long, n As Long, source As Long, dist() As Long)
    Dim visited() As Boolean
    ReDim visited(n - 1)

    Dim i As Long
    For i = 0 To n - 1
        dist(i) = 999999
    Next i
    dist(source) = 0

    Dim count As Long
    For count = 0 To n - 1
        Dim u As Long, best As Long
        best = 999999
        u = -1
        For i = 0 To n - 1
            If Not visited(i) And dist(i) < best Then
                best = dist(i)
                u = i
            End If
        Next i
        If u = -1 Then Exit For
        visited(u) = True

        Dim v As Long
        For v = 0 To n - 1
            If adjMatrix(u, v) > 0 And Not visited(v) Then
                If dist(u) + adjMatrix(u, v) < dist(v) Then
                    dist(v) = dist(u) + adjMatrix(u, v)
                End If
            End If
        Next v
    Next count
End Sub

Sub Main()
    Dim adj(3, 3) As Long
    ' Undirected graph: 0-1(4), 0-2(1), 1-2(2), 1-3(1), 2-3(5)
    adj(0, 1) = 4: adj(1, 0) = 4
    adj(0, 2) = 1: adj(2, 0) = 1
    adj(2, 1) = 2: adj(1, 2) = 2
    adj(1, 3) = 1: adj(3, 1) = 1
    adj(2, 3) = 5: adj(3, 2) = 5

    Dim dist(3) As Long
    Dijkstra adj, 4, 0, dist

    Dim i As Long
    For i = 0 To 3
        Debug.Print i & ": " & dist(i)
    Next i
End Sub
