Function MinCoins(coins() As Long, amount As Long) As Long
    Dim dp(1000) As Long
    Dim n As Long, c As Long
    dp(0) = 0
    For n = 1 To amount
        dp(n) = -1
        For c = LBound(coins) To UBound(coins)
            If coins(c) <= n And dp(n - coins(c)) <> -1 Then
                If dp(n) = -1 Or dp(n - coins(c)) + 1 < dp(n) Then
                    dp(n) = dp(n - coins(c)) + 1
                End If
            End If
        Next c
    Next n
    MinCoins = dp(amount)
End Function

Sub Main()
    Dim coins(2) As Long
    coins(0) = 1: coins(1) = 2: coins(2) = 5
    Debug.Print MinCoins(coins, 11)
End Sub
