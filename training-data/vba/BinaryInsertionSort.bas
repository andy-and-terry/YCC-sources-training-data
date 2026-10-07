Sub BinaryInsertionSort(arr() As Long)
    Dim i As Long, j As Long
    Dim lo As Long, hi As Long, mid As Long
    Dim key As Long

    For i = LBound(arr) + 1 To UBound(arr)
        key = arr(i)
        lo = LBound(arr)
        hi = i - 1
        Do While lo <= hi
            mid = (lo + hi) \ 2
            If arr(mid) > key Then
                hi = mid - 1
            Else
                lo = mid + 1
            End If
        Loop
        For j = i - 1 To lo Step -1
            arr(j + 1) = arr(j)
        Next j
        arr(lo) = key
    Next i
End Sub

Sub Main()
    Dim data(0 To 6) As Long
    Dim i As Long
    Dim v As Variant
    i = 0
    For Each v In Array(9, 3, 7, 1, 8, 2, 5)
        data(i) = v
        i = i + 1
    Next v
    BinaryInsertionSort data
    For i = 0 To UBound(data)
        Debug.Print data(i);
    Next i
    Debug.Print
End Sub
