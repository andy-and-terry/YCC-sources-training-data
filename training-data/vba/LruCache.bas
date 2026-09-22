Dim cacheValues As Object
Dim cacheOrder As Collection
Dim cacheCapacity As Long

Sub LruInit(capacity As Long)
    Set cacheValues = CreateObject("Scripting.Dictionary")
    Set cacheOrder = New Collection
    cacheCapacity = capacity
End Sub

Sub LruTouch(key As Long)
    Dim i As Long
    For i = 1 To cacheOrder.Count
        If cacheOrder(i) = key Then
            cacheOrder.Remove i
            Exit For
        End If
    Next i
    cacheOrder.Add key
End Sub

Function LruGet(key As Long) As Variant
    If cacheValues.Exists(key) Then
        LruTouch key
        LruGet = cacheValues(key)
    Else
        LruGet = -1
    End If
End Function

Sub LruPut(key As Long, value As Long)
    If Not cacheValues.Exists(key) And cacheValues.Count >= cacheCapacity Then
        Dim oldest As Long
        oldest = cacheOrder(1)
        cacheOrder.Remove 1
        cacheValues.Remove oldest
    End If
    cacheValues(key) = value
    LruTouch key
End Sub

Sub Main()
    LruInit 2
    LruPut 1, 1
    LruPut 2, 2
    Debug.Print LruGet(1)
    LruPut 3, 3
    Debug.Print LruGet(2)
    Debug.Print LruGet(3)
End Sub
