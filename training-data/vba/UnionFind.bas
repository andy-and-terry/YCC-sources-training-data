Dim parentArr(100) As Long

Sub InitUnionFind(n As Long)
    Dim i As Long
    For i = 0 To n - 1
        parentArr(i) = i
    Next i
End Sub

Function UfFind(x As Long) As Long
    If parentArr(x) = x Then
        UfFind = x
    Else
        UfFind = UfFind(parentArr(x))
    End If
End Function

Sub UfUnion(x As Long, y As Long)
    Dim rootX As Long, rootY As Long
    rootX = UfFind(x)
    rootY = UfFind(y)
    If rootX <> rootY Then parentArr(rootX) = rootY
End Sub

Sub Main()
    InitUnionFind 5
    UfUnion 0, 1
    UfUnion 1, 2
    Debug.Print UfFind(0) = UfFind(2)
    Debug.Print UfFind(0) = UfFind(3)
End Sub
