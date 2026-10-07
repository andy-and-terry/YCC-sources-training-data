' Class module: BSTNode
Public NodeValue As Long
Public LeftNode As BSTNode
Public RightNode As BSTNode

' The following would live in a standard module
Function InsertNode(node As BSTNode, value As Long) As BSTNode
    If node Is Nothing Then
        Dim newNode As New BSTNode
        newNode.NodeValue = value
        Set InsertNode = newNode
        Exit Function
    End If

    If value < node.NodeValue Then
        Set node.LeftNode = InsertNode(node.LeftNode, value)
    ElseIf value > node.NodeValue Then
        Set node.RightNode = InsertNode(node.RightNode, value)
    End If
    Set InsertNode = node
End Function

Sub InOrder(node As BSTNode)
    If node Is Nothing Then Exit Sub
    InOrder node.LeftNode
    Debug.Print node.NodeValue
    InOrder node.RightNode
End Sub

Sub Main()
    Dim root As BSTNode
    Dim values As Variant
    values = Array(5, 3, 8, 1, 4, 7, 9)

    Dim i As Long
    For i = LBound(values) To UBound(values)
        Set root = InsertNode(root, values(i))
    Next i

    InOrder root
End Sub
