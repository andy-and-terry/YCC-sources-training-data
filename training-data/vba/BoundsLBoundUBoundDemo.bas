Attribute VB_Name = "BoundsLBoundUBoundDemo"
Option Explicit

Public Sub BoundsDemo()
    Dim a(5 To 9) As Integer
    Dim grid(1 To 2, 0 To 3) As Integer
    Dim i As Long, j As Long

    For i = LBound(a) To UBound(a)
        a(i) = i * i
    Next i

    For i = LBound(a) To UBound(a)
        Debug.Print "a(" & i & ") = " & a(i)
    Next i

    ' second argument selects the dimension
    Debug.Print "rows " & LBound(grid, 1) & " to " & UBound(grid, 1)
    Debug.Print "cols " & LBound(grid, 2) & " to " & UBound(grid, 2)

    For i = LBound(grid, 1) To UBound(grid, 1)
        For j = LBound(grid, 2) To UBound(grid, 2)
            grid(i, j) = i * 10 + j
        Next j
    Next i
    Debug.Print "grid(2,3) = " & grid(2, 3)
End Sub
