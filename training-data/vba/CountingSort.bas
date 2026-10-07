Sub CountingSort(arr() As Long, maxValue As Long)
    Dim counts() As Long
    ReDim counts(0 To maxValue)
    Dim i As Long, v As Long, pos As Long

    For i = LBound(arr) To UBound(arr)
        counts(arr(i)) = counts(arr(i)) + 1
    Next i

    pos = LBound(arr)
    For v = 0 To maxValue
        Do While counts(v) > 0
            arr(pos) = v
            pos = pos + 1
            counts(v) = counts(v) - 1
        Loop
    Next v
End Sub

Sub Main()
    Dim data(7) As Long
    data(0) = 4: data(1) = 2: data(2) = 2: data(3) = 8: data(4) = 3: data(5) = 3: data(6) = 1: data(7) = 0
    CountingSort data, 8

    Dim i As Long
    For i = LBound(data) To UBound(data)
        Debug.Print data(i)
    Next i
End Sub
