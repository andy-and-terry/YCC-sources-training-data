Dim nodeKey(1 To 200) As Long
Dim nodeLeft(1 To 200) As Long
Dim nodeRight(1 To 200) As Long
Dim nodeHeight(1 To 200) As Long
Dim nodeCount As Long

Function NodeHeight(node As Long) As Long
    If node = 0 Then
        NodeHeight = 0
    Else
        NodeHeight = nodeHeight(node)
    End If
End Function

Sub UpdateHeight(node As Long)
    Dim lh As Long, rh As Long
    lh = NodeHeight(nodeLeft(node))
    rh = NodeHeight(nodeRight(node))
    If lh > rh Then
        nodeHeight(node) = lh + 1
    Else
        nodeHeight(node) = rh + 1
    End If
End Sub

Function BalanceFactor(node As Long) As Long
    BalanceFactor = NodeHeight(nodeLeft(node)) - NodeHeight(nodeRight(node))
End Function

Function NewNode(key As Long) As Long
    nodeCount = nodeCount + 1
    nodeKey(nodeCount) = key
    nodeLeft(nodeCount) = 0
    nodeRight(nodeCount) = 0
    nodeHeight(nodeCount) = 1
    NewNode = nodeCount
End Function

Function RotateRight(y As Long) As Long
    Dim x As Long, t2 As Long
    x = nodeLeft(y)
    t2 = nodeRight(x)
    nodeRight(x) = y
    nodeLeft(y) = t2
    UpdateHeight y
    UpdateHeight x
    RotateRight = x
End Function

Function RotateLeft(x As Long) As Long
    Dim y As Long, t2 As Long
    y = nodeRight(x)
    t2 = nodeLeft(y)
    nodeLeft(y) = x
    nodeRight(x) = t2
    UpdateHeight x
    UpdateHeight y
    RotateLeft = y
End Function

Function InsertNode(node As Long, key As Long) As Long
    If node = 0 Then
        InsertNode = NewNode(key)
        Exit Function
    End If

    If key < nodeKey(node) Then
        nodeLeft(node) = InsertNode(nodeLeft(node), key)
    ElseIf key > nodeKey(node) Then
        nodeRight(node) = InsertNode(nodeRight(node), key)
    Else
        InsertNode = node
        Exit Function
    End If

    UpdateHeight node
    Dim balance As Long
    balance = BalanceFactor(node)

    If balance > 1 And key < nodeKey(nodeLeft(node)) Then
        InsertNode = RotateRight(node)
    ElseIf balance < -1 And key > nodeKey(nodeRight(node)) Then
        InsertNode = RotateLeft(node)
    ElseIf balance > 1 And key > nodeKey(nodeLeft(node)) Then
        nodeLeft(node) = RotateLeft(nodeLeft(node))
        InsertNode = RotateRight(node)
    ElseIf balance < -1 And key < nodeKey(nodeRight(node)) Then
        nodeRight(node) = RotateRight(nodeRight(node))
        InsertNode = RotateLeft(node)
    Else
        InsertNode = node
    End If
End Function

Sub InOrder(node As Long, ByRef output As String)
    If node = 0 Then Exit Sub
    InOrder nodeLeft(node), output
    output = output & nodeKey(node) & " "
    InOrder nodeRight(node), output
End Sub

Sub Main()
    Dim root As Long
    root = 0
    Dim values As Variant
    values = Array(10, 20, 30, 40, 50, 25)

    Dim i As Long
    For i = LBound(values) To UBound(values)
        root = InsertNode(root, values(i))
    Next i

    Dim output As String
    InOrder root, output
    Debug.Print output
    Debug.Print "height: " & NodeHeight(root)
End Sub
