Sub Permute(arr() As Long, k As Long)
    Dim i As Long, temp As Long

    If k > UBound(arr) Then
        Dim s As String
        s = ""
        For i = LBound(arr) To UBound(arr)
            s = s & arr(i) & " "
        Next i
        Debug.Print Trim(s)
        Exit Sub
    End If

    For i = k To UBound(arr)
        temp = arr(k): arr(k) = arr(i): arr(i) = temp
        Permute arr, k + 1
        temp = arr(k): arr(k) = arr(i): arr(i) = temp
    Next i
End Sub

Sub Main()
    Dim data(2) As Long
    data(0) = 1: data(1) = 2: data(2) = 3
    Permute data, LBound(data)
End Sub
