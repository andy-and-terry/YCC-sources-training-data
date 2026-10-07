Function MatrixChainOrder(dims() As Long, n As Long) As Long
    Dim dp() As Long
    ReDim dp(0 To n - 1, 0 To n - 1)

    Dim len_ As Long, i As Long, j As Long, k As Long, cost As Long
    For len_ = 2 To n
        For i = 0 To n - len_
            j = i + len_ - 1
            dp(i, j) = 999999
            For k = i To j - 1
                cost = dp(i, k) + dp(k + 1, j) + dims(i) * dims(k + 1) * dims(j + 1)
                If cost < dp(i, j) Then
                    dp(i, j) = cost
                End If
            Next k
        Next i
    Next len_

    MatrixChainOrder = dp(0, n - 1)
End Function

Sub Main()
    Dim dims(4) As Long
    dims(0) = 10: dims(1) = 20: dims(2) = 30: dims(3) = 40: dims(4) = 30

    Debug.Print MatrixChainOrder(dims, 5)
End Sub
