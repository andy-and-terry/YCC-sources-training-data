Dim fenwickTree(100) As Long
Dim fenwickSize As Long

Sub FenwickInit(n As Long)
    Dim i As Long
    fenwickSize = n
    For i = 0 To n
        fenwickTree(i) = 0
    Next i
End Sub

Sub FenwickUpdate(index As Long, delta As Long)
    Dim i As Long
    i = index + 1
    Do While i <= fenwickSize
        fenwickTree(i) = fenwickTree(i) + delta
        i = i + (i And -i)
    Loop
End Sub

Function FenwickPrefixSum(index As Long) As Long
    Dim i As Long
    Dim total As Long
    i = index + 1
    total = 0
    Do While i > 0
        total = total + fenwickTree(i)
        i = i - (i And -i)
    Loop
    FenwickPrefixSum = total
End Function

Function FenwickRangeSum(left As Long, right As Long) As Long
    If left = 0 Then
        FenwickRangeSum = FenwickPrefixSum(right)
    Else
        FenwickRangeSum = FenwickPrefixSum(right) - FenwickPrefixSum(left - 1)
    End If
End Function

Sub Main()
    Dim values As Variant
    values = Array(1, 3, 5, 7, 9, 11)
    Dim i As Long

    FenwickInit 6
    For i = LBound(values) To UBound(values)
        FenwickUpdate i, CLng(values(i))
    Next i

    Debug.Print FenwickRangeSum(1, 3)
    FenwickUpdate 1, 10 - 3
    Debug.Print FenwickRangeSum(1, 3)
End Sub
