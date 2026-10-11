Sub Main()
    Debug.Print StrComp("apple", "Apple", vbBinaryCompare)
    Debug.Print StrComp("apple", "Apple", vbTextCompare)
    Debug.Print StrComp("a", "b")
    Debug.Print StrComp("b", "a")

    Dim names As Variant, i As Long, j As Long, t As String
    names = Array("delta", "Alpha", "charlie", "Bravo")
    For i = 0 To UBound(names) - 1
        For j = 0 To UBound(names) - 1 - i
            If StrComp(names(j), names(j + 1), vbTextCompare) > 0 Then
                t = names(j): names(j) = names(j + 1): names(j + 1) = t
            End If
        Next j
    Next i
    For i = 0 To UBound(names)
        Debug.Print names(i)
    Next i
End Sub
