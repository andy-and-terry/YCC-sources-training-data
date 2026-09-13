Type ListNode
    value As Long
    nextIndex As Long
End Type

Dim nodes(100) As ListNode
Dim nodeCount As Long
Dim headIndex As Long

Sub ListInit()
    nodeCount = 0
    headIndex = -1
End Sub

Sub ListPushFront(value As Long)
    nodes(nodeCount).value = value
    nodes(nodeCount).nextIndex = headIndex
    headIndex = nodeCount
    nodeCount = nodeCount + 1
End Sub

Sub ListPrintAll()
    Dim current As Long
    current = headIndex
    Do While current <> -1
        Debug.Print nodes(current).value
        current = nodes(current).nextIndex
    Loop
End Sub

Sub Main()
    ListInit
    ListPushFront 3
    ListPushFront 2
    ListPushFront 1
    ListPrintAll
End Sub
