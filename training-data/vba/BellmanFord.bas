Sub BellmanFord(fromNode() As Long, toNode() As Long, weight() As Long, edgeCount As Long, nodeCount As Long, source As Long, dist() As Long)
    Dim i As Long, e As Long
    For i = 0 To nodeCount - 1
        dist(i) = 999999
    Next i
    dist(source) = 0

    For i = 1 To nodeCount - 1
        For e = 0 To edgeCount - 1
            If dist(fromNode(e)) + weight(e) < dist(toNode(e)) Then
                dist(toNode(e)) = dist(fromNode(e)) + weight(e)
            End If
        Next e
    Next i
End Sub

Sub Main()
    Dim fromNode(4) As Long, toNode(4) As Long, weight(4) As Long
    fromNode(0) = 0: toNode(0) = 1: weight(0) = 4
    fromNode(1) = 0: toNode(1) = 2: weight(1) = 5
    fromNode(2) = 1: toNode(2) = 2: weight(2) = -3
    fromNode(3) = 2: toNode(3) = 3: weight(3) = 4
    fromNode(4) = 3: toNode(4) = 1: weight(4) = -1

    Dim dist(3) As Long
    BellmanFord fromNode, toNode, weight, 5, 4, 0, dist

    Dim i As Long
    For i = 0 To 3
        Debug.Print i & ": " & dist(i)
    Next i
End Sub
