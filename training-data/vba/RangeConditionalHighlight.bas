Sub HighlightAboveThreshold(target As Range, threshold As Double)
    Dim cell As Range
    For Each cell In target
        If IsNumeric(cell.Value) Then
            If cell.Value > threshold Then
                cell.Interior.Color = RGB(198, 239, 206)
            Else
                cell.Interior.ColorIndex = xlNone
            End If
        End If
    Next cell
End Sub

Sub Main()
    HighlightAboveThreshold Range("A1:A20"), 100
End Sub
