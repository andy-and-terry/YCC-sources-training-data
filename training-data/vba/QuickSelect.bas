Function Partition(arr As Variant, low As Long, high As Long) As Long
    Dim pivot As Long
    pivot = arr(high)
    Dim i As Long, j As Long, tmp As Long
    i = low
    For j = low To high - 1
        If arr(j) < pivot Then
            tmp = arr(i)
            arr(i) = arr(j)
            arr(j) = tmp
            i = i + 1
        End If
    Next j
    tmp = arr(i)
    arr(i) = arr(high)
    arr(high) = tmp
    Partition = i
End Function

Function QuickSelect(arr As Variant, low As Long, high As Long, k As Long) As Long
    If low = high Then
        QuickSelect = arr(low)
        Exit Function
    End If
    Dim pivotIndex As Long
    pivotIndex = Partition(arr, low, high)
    If k = pivotIndex Then
        QuickSelect = arr(k)
    ElseIf k < pivotIndex Then
        QuickSelect = QuickSelect(arr, low, pivotIndex - 1, k)
    Else
        QuickSelect = QuickSelect(arr, pivotIndex + 1, high, k)
    End If
End Function

Sub Main()
    Dim numbers As Variant
    numbers = Array(7, 10, 4, 3, 20, 15)
    Debug.Print QuickSelect(numbers, 0, UBound(numbers), 2)

    Dim numbers2 As Variant
    numbers2 = Array(7, 10, 4, 3, 20, 15)
    Debug.Print QuickSelect(numbers2, 0, UBound(numbers2), 0)
End Sub
