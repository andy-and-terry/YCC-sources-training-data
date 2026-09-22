Type BSTNode
    value As Long
    leftIndex As Long
    rightIndex As Long
End Type

Dim nodes(100) As BSTNode
Dim nodeCount As Long
Dim rootIndex As Long

Sub TreeInit()
    nodeCount = 0
    rootIndex = -1
End Sub

Function NewNode(value As Long) As Long
    nodes(nodeCount).value = value
    nodes(nodeCount).leftIndex = -1
    nodes(nodeCount).rightIndex = -1
    NewNode = nodeCount
    nodeCount = nodeCount + 1
End Function

Function InsertNode(nodeIndex As Long, value As Long) As Long
    If nodeIndex = -1 Then
        InsertNode = NewNode(value)
        Exit Function
    End If
    If value < nodes(nodeIndex).value Then
        nodes(nodeIndex).leftIndex = InsertNode(nodes(nodeIndex).leftIndex, value)
    ElseIf value > nodes(nodeIndex).value Then
        nodes(nodeIndex).rightIndex = InsertNode(nodes(nodeIndex).rightIndex, value)
    End If
    InsertNode = nodeIndex
End Function

Sub InorderPrint(nodeIndex As Long)
    If nodeIndex = -1 Then Exit Sub
    InorderPrint nodes(nodeIndex).leftIndex
    Debug.Print nodes(nodeIndex).value
    InorderPrint nodes(nodeIndex).rightIndex
End Sub

Sub Main()
    TreeInit
    Dim values As Variant
    values = Array(5, 3, 8, 1, 4, 7, 9)
    Dim i As Long
    For i = LBound(values) To UBound(values)
        rootIndex = InsertNode(rootIndex, CLng(values(i)))
    Next i
    InorderPrint rootIndex
End Sub
