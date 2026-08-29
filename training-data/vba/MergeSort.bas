Sub MergeArrays(arr() As Long, low As Long, mid As Long, high As Long)
    Dim temp(1000) As Long
    Dim i As Long, j As Long, k As Long
    i = low: j = mid + 1: k = low
    Do While i <= mid And j <= high
        If arr(i) <= arr(j) Then
            temp(k) = arr(i): i = i + 1
        Else
            temp(k) = arr(j): j = j + 1
        End If
        k = k + 1
    Loop
    Do While i <= mid
        temp(k) = arr(i): i = i + 1: k = k + 1
    Loop
    Do While j <= high
        temp(k) = arr(j): j = j + 1: k = k + 1
    Loop
    For i = low To high
        arr(i) = temp(i)
    Next i
End Sub

Sub MergeSort(arr() As Long, low As Long, high As Long)
    Dim mid As Long
    If low >= high Then Exit Sub
    mid = (low + high) \ 2
    MergeSort arr, low, mid
    MergeSort arr, mid + 1, high
    MergeArrays arr, low, mid, high
End Sub

Sub Main()
    Dim data(5) As Long
    data(0) = 5: data(1) = 2: data(2) = 9: data(3) = 1: data(4) = 5: data(5) = 6
    MergeSort data, 0, 5
    Dim i As Long
    For i = 0 To 5
        Debug.Print data(i)
    Next i
End Sub
