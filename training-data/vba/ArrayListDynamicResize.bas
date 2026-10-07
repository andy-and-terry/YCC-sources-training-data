Dim items() As Long
Dim itemCount As Long
Dim itemCapacity As Long

Sub ListInit()
    itemCapacity = 4
    itemCount = 0
    ReDim items(0 To itemCapacity - 1)
End Sub

Sub ListAppend(value As Long)
    If itemCount >= itemCapacity Then
        itemCapacity = itemCapacity * 2
        ReDim Preserve items(0 To itemCapacity - 1)
    End If
    items(itemCount) = value
    itemCount = itemCount + 1
End Sub

Function ListGet(index As Long) As Long
    ListGet = items(index)
End Function

Sub Main()
    ListInit

    Dim i As Long
    For i = 1 To 10
        ListAppend i * i
    Next i

    Dim output As String
    For i = 0 To itemCount - 1
        output = output & ListGet(i) & " "
    Next i
    Debug.Print output
    Debug.Print "capacity: " & itemCapacity
End Sub
