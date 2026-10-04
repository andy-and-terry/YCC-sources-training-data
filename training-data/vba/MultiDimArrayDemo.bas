Sub Main()
    Dim grid(1 To 3, 1 To 4) As Long
    Dim r As Long, c As Long

    For r = 1 To 3
        For c = 1 To 4
            grid(r, c) = r * c
        Next c
    Next r

    For r = 1 To 3
        Dim line As String
        line = ""
        For c = 1 To 4
            line = line & Right("  " & grid(r, c), 3)
        Next c
        Debug.Print line
    Next r

    Debug.Print "rows: "; UBound(grid, 1) - LBound(grid, 1) + 1
    Debug.Print "cols: "; UBound(grid, 2) - LBound(grid, 2) + 1

    Dim total As Long
    For r = 1 To 3
        total = total + grid(r, 4)
    Next r
    Debug.Print "last column sum: "; total

    Dim jagged(0 To 1) As Variant
    jagged(0) = Array(1, 2, 3)
    jagged(1) = Array("a", "b")
    Debug.Print jagged(0)(2); jagged(1)(0)
End Sub
