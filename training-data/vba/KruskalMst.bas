Dim parent(1 To 10) As Long

Function Find(x As Long) As Long
    If parent(x) <> x Then
        parent(x) = Find(parent(x))
    End If
    Find = parent(x)
End Function

Function UnionSets(a As Long, b As Long) As Boolean
    Dim rootA As Long, rootB As Long
    rootA = Find(a)
    rootB = Find(b)
    If rootA = rootB Then
        UnionSets = False
    Else
        parent(rootA) = rootB
        UnionSets = True
    End If
End Function

Sub Main()
    Dim n As Long
    n = 5
    Dim i As Long
    For i = 1 To n
        parent(i) = i
    Next i

    ' edges: from, to, weight
    Dim edgeFrom As Variant, edgeTo As Variant, edgeWeight As Variant
    edgeFrom = Array(1, 2, 1, 3, 4, 2)
    edgeTo = Array(2, 3, 3, 4, 5, 5)
    edgeWeight = Array(2, 3, 6, 8, 7, 5)

    ' sort edges by weight (simple bubble sort over indices)
    Dim order(5) As Long
    For i = 0 To 5
        order(i) = i
    Next i

    Dim j As Long, temp As Long
    For i = 0 To 5
        For j = 0 To 4 - i
            If edgeWeight(order(j)) > edgeWeight(order(j + 1)) Then
                temp = order(j)
                order(j) = order(j + 1)
                order(j + 1) = temp
            End If
        Next j
    Next i

    Dim totalWeight As Long
    totalWeight = 0
    For i = 0 To 5
        Dim idx As Long
        idx = order(i)
        If UnionSets(edgeFrom(idx), edgeTo(idx)) Then
            totalWeight = totalWeight + edgeWeight(idx)
            Debug.Print "used edge " & edgeFrom(idx) & "-" & edgeTo(idx) & " (" & edgeWeight(idx) & ")"
        End If
    Next i

    Debug.Print "MST total weight: " & totalWeight
End Sub
