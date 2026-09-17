Sub CountingSort(arr() As Long)
    Dim maxVal As Long, i As Long, j As Long, k As Long
    maxVal = arr(LBound(arr))
    For i = LBound(arr) To UBound(arr)
        If arr(i) > maxVal Then maxVal = arr(i)
    Next i

    Dim counts() As Long
    ReDim counts(0 To maxVal)
    For i = LBound(arr) To UBound(arr)
        counts(arr(i)) = counts(arr(i)) + 1
    Next i

    k = LBound(arr)
    For i = 0 To maxVal
        For j = 1 To counts(i)
            arr(k) = i
            k = k + 1
        Next j
    Next i
End Sub

Sub Main()
    Dim data(6) As Long
    data(0) = 4: data(1) = 2: data(2) = 2: data(3) = 8: data(4) = 3: data(5) = 3: data(6) = 1
    CountingSort data
    Dim i As Long
    For i = 0 To 6
        Debug.Print data(i)
    Next i
End Sub
