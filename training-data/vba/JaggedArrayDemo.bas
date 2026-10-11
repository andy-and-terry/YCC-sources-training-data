Sub Main()
    Dim jag(2) As Variant
    jag(0) = Array(1)
    jag(1) = Array(2, 3)
    jag(2) = Array(4, 5, 6)

    Dim i As Long, j As Long, line As String
    For i = 0 To UBound(jag)
        line = ""
        For j = 0 To UBound(jag(i))
            line = line & jag(i)(j) & " "
        Next j
        Debug.Print "Row " & i & " (" & (UBound(jag(i)) + 1) & " items): " & line
    Next i

    Dim pascal(4) As Variant
    For i = 0 To 4
        Dim row() As Long
        ReDim row(0 To i)
        row(0) = 1: row(i) = 1
        For j = 1 To i - 1
            row(j) = pascal(i - 1)(j - 1) + pascal(i - 1)(j)
        Next j
        pascal(i) = row
    Next i
    Debug.Print "Pascal row 4 middle: " & pascal(4)(2)
End Sub
