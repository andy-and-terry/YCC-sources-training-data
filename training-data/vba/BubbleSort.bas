Sub BubbleSort(arr() As Long)
    Dim i As Long, j As Long, temp As Long
    For i = LBound(arr) To UBound(arr) - 1
        For j = LBound(arr) To UBound(arr) - 1 - (i - LBound(arr))
            If arr(j) > arr(j + 1) Then
                temp = arr(j)
                arr(j) = arr(j + 1)
                arr(j + 1) = temp
            End If
        Next j
    Next i
End Sub

Sub Main()
    Dim data(5) As Long
    data(0) = 5: data(1) = 2: data(2) = 9: data(3) = 1: data(4) = 5: data(5) = 6
    BubbleSort data
    Dim i As Long
    For i = 0 To 5
        Debug.Print data(i)
    Next i
End Sub
