Sub Main()
    Dim d As Object
    Set d = CreateObject("Scripting.Dictionary")
    Dim words As Variant, w As Variant
    words = Split("the cat and the hat and the bat", " ")
    For Each w In words
        If d.Exists(w) Then d(w) = d(w) + 1 Else d.Add w, 1
    Next w

    Dim keys As Variant, i As Long, j As Long, tmp As Variant
    keys = d.Keys
    For i = 0 To UBound(keys) - 1
        For j = 0 To UBound(keys) - 1 - i
            If d(keys(j)) < d(keys(j + 1)) Then
                tmp = keys(j): keys(j) = keys(j + 1): keys(j + 1) = tmp
            End If
        Next j
    Next i
    For i = 0 To UBound(keys)
        Debug.Print keys(i) & ": " & d(keys(i))
    Next i
End Sub
