Dim stackItems As New Collection

Sub StackPush(item As Variant)
    stackItems.Add item
End Sub

Function StackPop() As Variant
    Dim top As Variant
    top = stackItems(stackItems.Count)
    stackItems.Remove stackItems.Count
    StackPop = top
End Function

Sub Main()
    StackPush 1
    StackPush 2
    StackPush 3
    Debug.Print StackPop()
    Debug.Print StackPop()
End Sub
