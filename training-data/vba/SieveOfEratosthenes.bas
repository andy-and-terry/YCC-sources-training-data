Sub SieveOfEratosthenes(limit As Long)
    Dim isComposite(1000) As Boolean
    Dim i As Long, j As Long
    For i = 2 To limit
        If i * i > limit Then Exit For
        If Not isComposite(i) Then
            For j = i * i To limit Step i
                isComposite(j) = True
            Next j
        End If
    Next i
    For i = 2 To limit
        If Not isComposite(i) Then Debug.Print i
    Next i
End Sub

Sub Main()
    SieveOfEratosthenes 50
End Sub
