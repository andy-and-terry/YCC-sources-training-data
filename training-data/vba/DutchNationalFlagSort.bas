Sub DutchFlagSort(arr() As Long)
    Dim low As Long, mid As Long, high As Long, temp As Long
    low = LBound(arr)
    mid = LBound(arr)
    high = UBound(arr)

    Do While mid <= high
        Select Case arr(mid)
            Case 0
                temp = arr(low): arr(low) = arr(mid): arr(mid) = temp
                low = low + 1
                mid = mid + 1
            Case 1
                mid = mid + 1
            Case 2
                temp = arr(mid): arr(mid) = arr(high): arr(high) = temp
                high = high - 1
        End Select
    Loop
End Sub

Sub Main()
    Dim data(8) As Long
    data(0) = 2: data(1) = 0: data(2) = 1: data(3) = 2: data(4) = 1
    data(5) = 0: data(6) = 0: data(7) = 2: data(8) = 1
    DutchFlagSort data

    Dim i As Long
    For i = LBound(data) To UBound(data)
        Debug.Print data(i);
    Next i
End Sub
