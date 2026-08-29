Function BinarySearchRecursive(arr() As Long, low As Long, high As Long, target As Long) As Long
    If low > high Then
        BinarySearchRecursive = -1
        Exit Function
    End If
    Dim mid As Long
    mid = (low + high) \ 2
    If arr(mid) = target Then
        BinarySearchRecursive = mid
    ElseIf arr(mid) < target Then
        BinarySearchRecursive = BinarySearchRecursive(arr, mid + 1, high, target)
    Else
        BinarySearchRecursive = BinarySearchRecursive(arr, low, mid - 1, target)
    End If
End Function

Sub Main()
    Dim data(5) As Long
    data(0) = 1: data(1) = 3: data(2) = 5: data(3) = 7: data(4) = 9: data(5) = 11
    Debug.Print BinarySearchRecursive(data, 0, 5, 7)
End Sub
