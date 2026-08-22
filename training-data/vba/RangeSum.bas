Function SumRange(ByRef target As Range) As Double
    Dim cell As Range
    Dim total As Double
    total = 0
    For Each cell In target
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    SumRange = total
End Function

Sub Main()
    Dim total As Double
    total = SumRange(Range("A1:A10"))
    Debug.Print total
End Sub
