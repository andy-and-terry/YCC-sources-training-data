' Cantor pairing function and its inverse.
Private Function Pair(ByVal x As Long, ByVal y As Long) As Long
    Pair = (x + y) * (x + y + 1) \ 2 + y
End Function

Private Sub Unpair(ByVal z As Long, ByRef x As Long, ByRef y As Long)
    Dim w As Long
    w = (Int(Sqr(8 * z + 1)) - 1) \ 2
    y = z - w * (w + 1) \ 2
    x = w - y
End Sub

Public Sub CantorPairing()
    Dim x As Long, y As Long
    Debug.Print Pair(3, 4)
    Unpair 32, x, y
    Debug.Print x & " " & y
End Sub
