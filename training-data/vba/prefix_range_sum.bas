Attribute VB_Name = "PrefixRangeSum"
Option Explicit

Public Function BuildPrefix(values As Variant) As Variant
    Dim prefix() As Long, i As Long
    ReDim prefix(0 To UBound(values) - LBound(values) + 1)
    For i = LBound(values) To UBound(values)
        prefix(i - LBound(values) + 1) = prefix(i - LBound(values)) + values(i)
    Next i
    BuildPrefix = prefix
End Function

Public Sub Demo()
    Dim p As Variant
    p = BuildPrefix(Array(3, 1, 4, 1, 5, 9, 2, 6))
    Debug.Print p(5) - p(2)
End Sub
