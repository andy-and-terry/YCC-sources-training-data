Sub CaseInsensitiveSort(arr() As String)
    Dim i As Long, j As Long, temp As String
    For i = LBound(arr) To UBound(arr) - 1
        For j = LBound(arr) To UBound(arr) - 1 - (i - LBound(arr))
            If StrComp(arr(j), arr(j + 1), vbTextCompare) > 0 Then
                temp = arr(j)
                arr(j) = arr(j + 1)
                arr(j + 1) = temp
            End If
        Next j
    Next i
End Sub

Sub Main()
    Dim words(4) As String
    words(0) = "banana": words(1) = "Apple": words(2) = "cherry": words(3) = "apple": words(4) = "Banana"
    CaseInsensitiveSort words
    Dim i As Long
    For i = 0 To 4
        Debug.Print words(i)
    Next i
End Sub
