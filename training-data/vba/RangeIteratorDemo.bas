Function FindMaxInRange(rng As Range) As Double
    Dim cell As Range
    Dim maxVal As Double
    Dim first As Boolean
    first = True

    For Each cell In rng
        If IsNumeric(cell.Value) Then
            If first Then
                maxVal = cell.Value
                first = False
            ElseIf cell.Value > maxVal Then
                maxVal = cell.Value
            End If
        End If
    Next cell

    FindMaxInRange = maxVal
End Function

Function FindMaxCellAddress(rng As Range) As String
    Dim cell As Range
    Dim maxVal As Double
    Dim maxCell As Range
    Dim first As Boolean
    first = True

    For Each cell In rng
        If IsNumeric(cell.Value) Then
            If first Or cell.Value > maxVal Then
                maxVal = cell.Value
                Set maxCell = cell
                first = False
            End If
        End If
    Next cell

    FindMaxCellAddress = maxCell.Address
End Function

Sub Main()
    Debug.Print FindMaxInRange(Range("A1:A10"))
    Debug.Print FindMaxCellAddress(Range("A1:A10"))
End Sub
