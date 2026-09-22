Sub Heapify(arr() As Long, n As Long, i As Long)
    Dim largest As Long, left As Long, right As Long, temp As Long
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2

    If left < n And arr(left) > arr(largest) Then largest = left
    If right < n And arr(right) > arr(largest) Then largest = right

    If largest <> i Then
        temp = arr(i)
        arr(i) = arr(largest)
        arr(largest) = temp
        Heapify arr, n, largest
    End If
End Sub

Sub HeapSort(arr() As Long)
    Dim n As Long, i As Long, temp As Long
    n = UBound(arr) - LBound(arr) + 1

    For i = n \ 2 - 1 To 0 Step -1
        Heapify arr, n, i
    Next i

    For i = n - 1 To 1 Step -1
        temp = arr(0)
        arr(0) = arr(i)
        arr(i) = temp
        Heapify arr, i, 0
    Next i
End Sub

Sub Main()
    Dim data(5) As Long
    data(0) = 5: data(1) = 3: data(2) = 8: data(3) = 1: data(4) = 9: data(5) = 2
    HeapSort data
    Dim i As Long
    For i = 0 To 5
        Debug.Print data(i)
    Next i
End Sub
