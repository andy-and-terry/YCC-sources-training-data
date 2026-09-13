Dim queueItems As New Collection

Sub QueueEnqueue(item As Variant)
    queueItems.Add item
End Sub

Function QueueDequeue() As Variant
    Dim front As Variant
    front = queueItems(1)
    queueItems.Remove 1
    QueueDequeue = front
End Function

Function QueueIsEmpty() As Boolean
    QueueIsEmpty = (queueItems.Count = 0)
End Function

Sub Main()
    QueueEnqueue "first"
    QueueEnqueue "second"
    QueueEnqueue "third"

    Do While Not QueueIsEmpty()
        Debug.Print QueueDequeue()
    Loop
End Sub
