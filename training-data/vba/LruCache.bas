Dim cacheKeys(1 To 100) As Long
Dim cacheValues(1 To 100) As Long
Dim cacheOrder(1 To 100) As Long ' higher = more recently used
Dim cacheCount As Long
Dim cacheCapacity As Long
Dim useCounter As Long

Sub LruInit(capacity As Long)
    cacheCapacity = capacity
    cacheCount = 0
    useCounter = 0
End Sub

Function LruFindSlot(key As Long) As Long
    Dim i As Long
    For i = 1 To cacheCount
        If cacheKeys(i) = key Then
            LruFindSlot = i
            Exit Function
        End If
    Next i
    LruFindSlot = -1
End Function

Function LruGet(key As Long) As Long
    Dim slot As Long
    slot = LruFindSlot(key)
    If slot = -1 Then
        LruGet = -1
        Exit Function
    End If
    useCounter = useCounter + 1
    cacheOrder(slot) = useCounter
    LruGet = cacheValues(slot)
End Function

Sub LruPut(key As Long, value As Long)
    Dim slot As Long
    slot = LruFindSlot(key)
    useCounter = useCounter + 1

    If slot <> -1 Then
        cacheValues(slot) = value
        cacheOrder(slot) = useCounter
        Exit Sub
    End If

    If cacheCount >= cacheCapacity Then
        Dim oldest As Long, oldestOrder As Long, i As Long
        oldest = 1
        oldestOrder = cacheOrder(1)
        For i = 2 To cacheCount
            If cacheOrder(i) < oldestOrder Then
                oldestOrder = cacheOrder(i)
                oldest = i
            End If
        Next i
        cacheKeys(oldest) = key
        cacheValues(oldest) = value
        cacheOrder(oldest) = useCounter
    Else
        cacheCount = cacheCount + 1
        cacheKeys(cacheCount) = key
        cacheValues(cacheCount) = value
        cacheOrder(cacheCount) = useCounter
    End If
End Sub

Sub Main()
    LruInit 2
    LruPut 1, 10
    LruPut 2, 20
    Debug.Print LruGet(1)
    LruPut 3, 30
    Debug.Print LruGet(2)
    Debug.Print LruGet(3)
End Sub
