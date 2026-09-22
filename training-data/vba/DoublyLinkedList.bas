Type DListNode
    value As Long
    prevIndex As Long
    nextIndex As Long
End Type

Dim dNodes(100) As DListNode
Dim dNodeCount As Long
Dim dHeadIndex As Long
Dim dTailIndex As Long

Sub DListInit()
    dNodeCount = 0
    dHeadIndex = -1
    dTailIndex = -1
End Sub

Sub DListPushBack(value As Long)
    Dim newIndex As Long
    newIndex = dNodeCount
    dNodes(newIndex).value = value
    dNodes(newIndex).prevIndex = dTailIndex
    dNodes(newIndex).nextIndex = -1

    If dTailIndex <> -1 Then
        dNodes(dTailIndex).nextIndex = newIndex
    Else
        dHeadIndex = newIndex
    End If
    dTailIndex = newIndex
    dNodeCount = dNodeCount + 1
End Sub

Sub DListPushFront(value As Long)
    Dim newIndex As Long
    newIndex = dNodeCount
    dNodes(newIndex).value = value
    dNodes(newIndex).nextIndex = dHeadIndex
    dNodes(newIndex).prevIndex = -1

    If dHeadIndex <> -1 Then
        dNodes(dHeadIndex).prevIndex = newIndex
    Else
        dTailIndex = newIndex
    End If
    dHeadIndex = newIndex
    dNodeCount = dNodeCount + 1
End Sub

Sub DListPrintForward()
    Dim current As Long
    current = dHeadIndex
    Do While current <> -1
        Debug.Print dNodes(current).value
        current = dNodes(current).nextIndex
    Loop
End Sub

Sub DListPrintBackward()
    Dim current As Long
    current = dTailIndex
    Do While current <> -1
        Debug.Print dNodes(current).value
        current = dNodes(current).prevIndex
    Loop
End Sub

Sub Main()
    DListInit
    DListPushBack 2
    DListPushBack 3
    DListPushFront 1
    DListPrintForward
    Debug.Print "---"
    DListPrintBackward
End Sub
