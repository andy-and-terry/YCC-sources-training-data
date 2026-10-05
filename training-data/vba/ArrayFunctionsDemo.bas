Sub Main()
    Dim fruits As Variant
    fruits = Array("pear", "apple", "fig")
    Debug.Print LBound(fruits), UBound(fruits)
    Debug.Print Join(fruits, ", ")

    Dim parts() As String
    parts = Split("a;b;c;d", ";")
    Debug.Print UBound(parts) + 1

    Dim nums() As Long
    Dim i As Long
    ReDim nums(0 To 2)
    For i = 0 To 2: nums(i) = i * 10: Next i

    ReDim Preserve nums(0 To 4)
    nums(3) = 30: nums(4) = 40
    For i = LBound(nums) To UBound(nums)
        Debug.Print nums(i);
    Next i
    Debug.Print

    Erase nums
    Debug.Print IsArray(fruits), IsArray(nums)
    Debug.Print Filter(parts, "b")(0)
End Sub
