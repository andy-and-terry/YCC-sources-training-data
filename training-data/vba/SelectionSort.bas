Sub SelectionSort(arr() As Long)
    Dim i As Long, j As Long, minIdx As Long, temp As Long
    For i = LBound(arr) To UBound(arr) - 1
        minIdx = i
        For j = i + 1 To UBound(arr)
            If arr(j) < arr(minIdx) Then minIdx = j
        Next j
        temp = arr(i)
        arr(i) = arr(minIdx)
        arr(minIdx) = temp
    Next i
End Sub

Sub Main()
    Dim data(5) As Long
    data(0) = 5: data(1) = 3: data(2) = 8: data(3) = 1: data(4) = 9: data(5) = 2
    SelectionSort data
    Dim i As Long
    For i = 0 To 5
        Debug.Print data(i)
    Next i
End Sub
