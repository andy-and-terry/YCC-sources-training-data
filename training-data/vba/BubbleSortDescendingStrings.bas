Sub SortDescending(arr() As String)
    Dim i As Long, j As Long, tmp As String, swapped As Boolean
    For i = UBound(arr) To LBound(arr) + 1 Step -1
        swapped = False
        For j = LBound(arr) To i - 1
            If arr(j) < arr(j + 1) Then
                tmp = arr(j): arr(j) = arr(j + 1): arr(j + 1) = tmp
                swapped = True
            End If
        Next j
        If Not swapped Then Exit For
    Next i
End Sub

Sub Main()
    Dim words(3) As String, i As Long
    words(0) = "pear": words(1) = "apple": words(2) = "zebra": words(3) = "mango"
    SortDescending words
    For i = 0 To 3: Debug.Print words(i): Next i
End Sub
