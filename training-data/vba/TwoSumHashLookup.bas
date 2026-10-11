Function TwoSum(nums As Variant, ByVal target As Long) As Variant
    Dim seen As Object, i As Long, need As Long
    Set seen = CreateObject("Scripting.Dictionary")
    For i = LBound(nums) To UBound(nums)
        need = target - nums(i)
        If seen.Exists(need) Then
            TwoSum = Array(seen(need), i)
            Exit Function
        End If
        seen(nums(i)) = i
    Next i
    TwoSum = Array(-1, -1)
End Function

Sub Main()
    Dim r As Variant
    r = TwoSum(Array(2, 7, 11, 15), 9)
    Debug.Print "Indices: " & r(0) & ", " & r(1)
    r = TwoSum(Array(3, 2, 4), 6)
    Debug.Print "Indices: " & r(0) & ", " & r(1)
End Sub
