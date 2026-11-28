Public Function EquilibriumIndex(nums As Variant) As Long
    Dim total As Long, left As Long, i As Long
    For i = LBound(nums) To UBound(nums)
        total = total + nums(i)
    Next i
    For i = LBound(nums) To UBound(nums)
        If left = total - left - nums(i) Then
            EquilibriumIndex = i - LBound(nums)
            Exit Function
        End If
        left = left + nums(i)
    Next i
    EquilibriumIndex = -1
End Function

Public Sub DemoEquilibrium()
    Debug.Print EquilibriumIndex(Array(1, 7, 3, 6, 5, 6)) ' 3
End Sub
