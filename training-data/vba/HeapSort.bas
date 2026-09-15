Sub Heapify(arr() As Long, n As Long, i As Long)
    Dim largest As Long, left As Long, right As Long, tmp As Long
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2

    If left < n And arr(left) > arr(largest) Then largest = left
    If right < n And arr(right) > arr(largest) Then largest = right

    If largest <> i Then
        tmp = arr(i)
        arr(i) = arr(largest)
        arr(largest) = tmp
        Heapify arr, n, largest
    End If
End Sub

Sub HeapSort(arr() As Long, n As Long)
    Dim i As Long, tmp As Long
    For i = n \ 2 - 1 To 0 Step -1
        Heapify arr, n, i
    Next i
    For i = n - 1 To 1 Step -1
        tmp = arr(0)
        arr(0) = arr(i)
        arr(i) = tmp
        Heapify arr, i, 0
    Next i
End Sub

Sub Main()
    Dim data(6) As Long
    data(0) = 5: data(1) = 2: data(2) = 9: data(3) = 1: data(4) = 5: data(5) = 6: data(6) = 3
    HeapSort data, 7
    Dim i As Long
    For i = 0 To 6
        Debug.Print data(i)
    Next i
End Sub
