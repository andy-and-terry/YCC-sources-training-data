Function BinarySearch(arr() As Long, ByVal target As Long) As Long
    Dim low As Long, high As Long, mid As Long
    low = LBound(arr)
    high = UBound(arr)
    Do While low <= high
        mid = (low + high) \ 2
        If arr(mid) = target Then
            BinarySearch = mid
            Exit Function
        ElseIf arr(mid) < target Then
            low = mid + 1
        Else
            high = mid - 1
        End If
    Loop
    BinarySearch = -1
End Function

Sub Main()
    Dim sorted(6) As Long
    sorted(0) = 1: sorted(1) = 3: sorted(2) = 5: sorted(3) = 7
    sorted(4) = 9: sorted(5) = 11: sorted(6) = 13
    Debug.Print BinarySearch(sorted, 7)
    Debug.Print BinarySearch(sorted, 4)
End Sub
