Function RemoveDuplicatesInRange(target As Range) As Long
    Dim seen As Object
    Set seen = CreateObject("Scripting.Dictionary")
    Dim cell As Range
    Dim removed As Long
    removed = 0

    For Each cell In target
        If Not IsEmpty(cell.Value) Then
            If seen.Exists(cell.Value) Then
                cell.ClearContents
                removed = removed + 1
            Else
                seen.Add cell.Value, True
            End If
        End If
    Next cell

    RemoveDuplicatesInRange = removed
End Function

Sub Main()
    Dim total As Long
    total = RemoveDuplicatesInRange(Range("A1:A10"))
    Debug.Print total
End Sub
