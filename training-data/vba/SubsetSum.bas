Function HasSubsetSum(values As Variant, target As Long) As Boolean
    Dim n As Long
    n = UBound(values) - LBound(values) + 1
    Dim dp() As Boolean
    ReDim dp(n, target)

    Dim i As Long, s As Long
    For i = 0 To n
        dp(i, 0) = True
    Next i

    For i = 1 To n
        Dim v As Long
        v = CLng(values(LBound(values) + i - 1))
        For s = 1 To target
            dp(i, s) = dp(i - 1, s)
            If v <= s Then
                If dp(i - 1, s - v) Then dp(i, s) = True
            End If
        Next s
    Next i

    HasSubsetSum = dp(n, target)
End Function

Sub Main()
    Dim values As Variant
    values = Array(3, 34, 4, 12, 5, 2)
    Debug.Print HasSubsetSum(values, 9)
    Debug.Print HasSubsetSum(values, 10)
End Sub
