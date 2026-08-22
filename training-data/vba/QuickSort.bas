Sub QuickSort(arr() As Long, ByVal low As Long, ByVal high As Long)
    Dim i As Long, j As Long, pivot As Long, temp As Long
    If low >= high Then Exit Sub
    pivot = arr((low + high) \ 2)
    i = low
    j = high
    Do While i <= j
        Do While arr(i) < pivot
            i = i + 1
        Loop
        Do While arr(j) > pivot
            j = j - 1
        Loop
        If i <= j Then
            temp = arr(i)
            arr(i) = arr(j)
            arr(j) = temp
            i = i + 1
            j = j - 1
        End If
    Loop
    QuickSort arr, low, j
    QuickSort arr, i, high
End Sub

Sub Main()
    Dim data(5) As Long
    data(0) = 5: data(1) = 3: data(2) = 8: data(3) = 1: data(4) = 9: data(5) = 2
    QuickSort data, 0, 5
    Dim i As Long
    For i = 0 To 5
        Debug.Print data(i)
    Next i
End Sub
