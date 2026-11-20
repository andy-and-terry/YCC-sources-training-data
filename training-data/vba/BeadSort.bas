' Bead (gravity) sort.
Public Function BeadSort(nums As Variant) As Variant
    Dim cols() As Long, rows() As Long, i As Long, j As Long, c As Long, mx As Long
    For i = LBound(nums) To UBound(nums)
        If nums(i) > mx Then mx = nums(i)
    Next i
    ReDim cols(1 To mx)
    For i = 1 To mx
        For j = LBound(nums) To UBound(nums)
            If nums(j) >= i Then cols(i) = cols(i) + 1
        Next j
    Next i
    ReDim rows(0 To UBound(nums) - LBound(nums))
    For i = 1 To UBound(rows) + 1
        c = 0
        For j = 1 To mx
            If cols(j) >= i Then c = c + 1
        Next j
        rows(UBound(rows) + 1 - i) = c
    Next i
    BeadSort = rows
End Function
