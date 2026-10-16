Private items As Collection

Sub InitStack()
    Set items = New Collection
End Sub

Sub Push(ByVal v As Variant)
    items.Add v
End Sub

Function Pop() As Variant
    If items.Count = 0 Then
        Pop = Empty
        Exit Function
    End If
    Pop = items(items.Count)
    items.Remove items.Count
End Function

Function Peek() As Variant
    Peek = items(items.Count)
End Function

Sub Main()
    InitStack
    Push 10
    Push 20
    Push 30
    Debug.Print "Peek: " & Peek()
    Debug.Print "Pop: " & Pop()
    Debug.Print "Pop: " & Pop()
    Debug.Print "Remaining: " & items.Count
End Sub
