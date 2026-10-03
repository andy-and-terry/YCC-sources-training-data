Dim tree(1 To 100) As Long
Dim treeSize As Long

Sub FenwickInit(n As Long)
    treeSize = n
    Dim i As Long
    For i = 1 To n
        tree(i) = 0
    Next i
End Sub

Sub FenwickUpdate(index As Long, delta As Long)
    Dim i As Long
    i = index
    Do While i <= treeSize
        tree(i) = tree(i) + delta
        i = i + (i And -i)
    Loop
End Sub

Function FenwickQuery(index As Long) As Long
    Dim total As Long
    Dim i As Long
    i = index
    total = 0
    Do While i > 0
        total = total + tree(i)
        i = i - (i And -i)
    Loop
    FenwickQuery = total
End Function

Function FenwickRangeSum(fromIndex As Long, toIndex As Long) As Long
    FenwickRangeSum = FenwickQuery(toIndex) - FenwickQuery(fromIndex - 1)
End Function

Sub Main()
    FenwickInit 10
    Dim values As Variant
    values = Array(3, 2, -1, 6, 5, 4, -3, 3, 7, 2)

    Dim i As Long
    For i = 1 To 10
        FenwickUpdate i, values(i - 1)
    Next i

    Debug.Print "sum(1,5) = " & FenwickRangeSum(1, 5)
    Debug.Print "sum(1,10) = " & FenwickRangeSum(1, 10)
    FenwickUpdate 3, 10
    Debug.Print "sum(1,5) after update = " & FenwickRangeSum(1, 5)
End Sub
