Sub Main()
    Dim grid(1 To 3, 1 To 4) As Long
    Dim r As Long, c As Long

    For r = 1 To 3
        For c = 1 To 4
            grid(r, c) = r * c
        Next c
    Next r

    For r = 1 To UBound(grid, 1)
        Dim line As String
        line = ""
        For c = 1 To UBound(grid, 2)
            line = line & grid(r, c) & vbTab
        Next c
        Debug.Print line
    Next r

    Dim rowSum As Long
    For c = LBound(grid, 2) To UBound(grid, 2)
        rowSum = rowSum + grid(2, c)
    Next c
    Debug.Print "row 2 sum:"; rowSum
End Sub
