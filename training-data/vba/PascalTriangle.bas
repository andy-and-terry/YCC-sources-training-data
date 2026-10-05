Function PascalRow(ByVal n As Long) As Variant
    Dim row() As Long
    Dim i As Long, j As Long
    ReDim row(0 To n)
    row(0) = 1
    For i = 1 To n
        For j = i To 1 Step -1
            row(j) = row(j) + row(j - 1)
        Next j
    Next i
    PascalRow = row
End Function

Sub Main()
    Dim r As Long, c As Long
    Dim row As Variant
    Dim line As String
    For r = 0 To 5
        row = PascalRow(r)
        line = ""
        For c = LBound(row) To UBound(row)
            line = line & row(c) & " "
        Next c
        Debug.Print Trim(line)
    Next r
End Sub
