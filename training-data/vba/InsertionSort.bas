Sub InsertionSort(arr() As Long)
    Dim i As Long, j As Long, key As Long
    For i = LBound(arr) + 1 To UBound(arr)
        key = arr(i)
        j = i - 1
        Do While j >= LBound(arr) And arr(j) > key
            arr(j + 1) = arr(j)
            j = j - 1
        Loop
        arr(j + 1) = key
    Next i
End Sub

Sub Main()
    Dim data(4) As Long
    data(0) = 12: data(1) = 11: data(2) = 13: data(3) = 5: data(4) = 6
    InsertionSort data
    Dim i As Long
    For i = 0 To 4
        Debug.Print data(i)
    Next i
End Sub
