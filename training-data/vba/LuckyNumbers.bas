Sub Main()
    Dim nums(0 To 31) As Long
    Dim length As Long, idx As Long, stepSize As Long, kept As Long
    Dim n As Long, j As Long, result As String
    For n = 1 To 50 Step 2
        nums(length) = n
        length = length + 1
    Next n
    idx = 1
    Do While idx < length
        stepSize = nums(idx)
        If stepSize > length Then Exit Do
        kept = 0
        For j = 0 To length - 1
            If (j + 1) Mod stepSize <> 0 Then
                nums(kept) = nums(j)
                kept = kept + 1
            End If
        Next j
        length = kept
        idx = idx + 1
    Loop
    result = CStr(nums(0))
    For j = 1 To length - 1
        result = result & " " & nums(j)
    Next j
    Debug.Print result
End Sub
