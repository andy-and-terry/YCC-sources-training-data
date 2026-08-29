Function Kadane(arr() As Long) As Long
    Dim best As Long, current As Long, i As Long
    best = arr(LBound(arr))
    current = arr(LBound(arr))
    For i = LBound(arr) + 1 To UBound(arr)
        If arr(i) > current + arr(i) Then
            current = arr(i)
        Else
            current = current + arr(i)
        End If
        If current > best Then best = current
    Next i
    Kadane = best
End Function

Sub Main()
    Dim data(8) As Long
    data(0) = -2: data(1) = 1: data(2) = -3: data(3) = 4: data(4) = -1
    data(5) = 2: data(6) = 1: data(7) = -5: data(8) = 4
    Debug.Print Kadane(data)
End Sub
