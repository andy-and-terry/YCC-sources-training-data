Sub BubbleSort(a() As Long)
    Dim i As Long, j As Long, t As Long
    For i = LBound(a) To UBound(a) - 1
        For j = LBound(a) To UBound(a) - i - 1
            If a(j) > a(j + 1) Then t = a(j): a(j) = a(j + 1): a(j + 1) = t
        Next j
    Next i
End Sub
