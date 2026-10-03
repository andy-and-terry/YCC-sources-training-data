Function RodCutting(prices() As Long, n As Long) As Long
    Dim dp() As Long
    ReDim dp(0 To n)
    dp(0) = 0

    Dim len_ As Long, cut As Long, best As Long
    For len_ = 1 To n
        best = -999999
        For cut = 1 To len_
            If prices(cut - 1) + dp(len_ - cut) > best Then
                best = prices(cut - 1) + dp(len_ - cut)
            End If
        Next cut
        dp(len_) = best
    Next len_

    RodCutting = dp(n)
End Function

Sub Main()
    Dim prices(7) As Long
    prices(0) = 1: prices(1) = 5: prices(2) = 8: prices(3) = 9
    prices(4) = 10: prices(5) = 17: prices(6) = 17: prices(7) = 20

    Debug.Print RodCutting(prices, 8)
End Sub
