Sub TwoSum(nums() As Long, target As Long)
    Dim i As Long, j As Long
    For i = LBound(nums) To UBound(nums) - 1
        For j = i + 1 To UBound(nums)
            If nums(i) + nums(j) = target Then
                Debug.Print i; j
                Exit Sub
            End If
        Next j
    Next i
End Sub

Sub Main()
    Dim nums(3) As Long
    nums(0) = 2: nums(1) = 7: nums(2) = 11: nums(3) = 15
    TwoSum nums, 9
End Sub
