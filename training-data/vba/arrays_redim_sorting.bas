Sub ArraysAndSorting()
    Dim a() As Long
    ReDim a(1 To 5)
    Dim i As Long
    For i = 1 To 5: a(i) = (6 - i) * 3: Next i
    ReDim Preserve a(1 To 7)
    a(6) = 1: a(7) = 100
    BubbleSort a
    Dim out As String
    For i = LBound(a) To UBound(a): out = out & a(i) & " ": Next i
    Debug.Print out
    Dim m(1 To 2, 1 To 3) As Integer
    m(2, 3) = 9
    Debug.Print UBound(m, 1), UBound(m, 2), m(2, 3)
    Dim v As Variant: v = Array(10, 20, 30)
    Debug.Print v(0) + v(2), UBound(v), IsArray(v)
    Erase a
End Sub

Sub BubbleSort(arr() As Long)
    Dim i As Long, j As Long, t As Long
    For i = LBound(arr) To UBound(arr) - 1
        For j = LBound(arr) To UBound(arr) - i
            If arr(j) > arr(j + 1) Then t = arr(j): arr(j) = arr(j + 1): arr(j + 1) = t
        Next j
    Next i
End Sub
