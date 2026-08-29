Function Knapsack(weights() As Long, values() As Long, capacity As Long) As Long
    Dim dp(1000) As Long
    Dim i As Long, cap As Long
    For i = LBound(weights) To UBound(weights)
        For cap = capacity To weights(i) Step -1
            If dp(cap - weights(i)) + values(i) > dp(cap) Then
                dp(cap) = dp(cap - weights(i)) + values(i)
            End If
        Next cap
    Next i
    Knapsack = dp(capacity)
End Function

Sub Main()
    Dim weights(3) As Long, values(3) As Long
    weights(0) = 2: weights(1) = 3: weights(2) = 4: weights(3) = 5
    values(0) = 3: values(1) = 4: values(2) = 5: values(3) = 6
    Debug.Print Knapsack(weights, values, 5)
End Sub
