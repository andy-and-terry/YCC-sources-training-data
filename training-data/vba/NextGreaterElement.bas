Sub NextGreaterElements(nums() As Long, n As Long, result() As Long)
    Dim stack() As Long
    ReDim stack(0 To n - 1)
    Dim top As Long
    top = 0

    Dim i As Long
    For i = 0 To n - 1
        result(i) = -1
    Next i

    For i = 0 To n - 1
        Do While top > 0 And nums(stack(top - 1)) < nums(i)
            top = top - 1
            result(stack(top)) = nums(i)
        Loop
        stack(top) = i
        top = top + 1
    Next i
End Sub

Sub Main()
    Dim nums(4) As Long
    nums(0) = 2: nums(1) = 1: nums(2) = 2: nums(3) = 4: nums(4) = 3

    Dim result(4) As Long
    NextGreaterElements nums, 5, result

    Dim output As String
    Dim i As Long
    For i = 0 To 4
        output = output & result(i) & " "
    Next i
    Debug.Print output
End Sub
