Sub SelectionSortDesc(a() As Long)
    Dim i As Long, j As Long, maxIdx As Long, t As Long
    For i = LBound(a) To UBound(a) - 1
        maxIdx = i
        For j = i + 1 To UBound(a)
            If a(j) > a(maxIdx) Then maxIdx = j
        Next j
        If maxIdx <> i Then
            t = a(i): a(i) = a(maxIdx): a(maxIdx) = t
        End If
    Next i
End Sub

Sub Main()
    Dim a(5) As Long, i As Long, line As String
    a(0) = 12: a(1) = 7: a(2) = 25: a(3) = 3: a(4) = 18: a(5) = 9
    SelectionSortDesc a
    For i = 0 To 5: line = line & a(i) & " ": Next i
    Debug.Print line
End Sub
