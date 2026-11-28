Function ReverseByte(ByVal v As Long) As Long
    Dim i As Long, r As Long
    For i = 1 To 8
        r = r * 2 + (v And 1)
        v = v \ 2
    Next i
    ReverseByte = r
End Function

Sub ShowBitReversal()
    Dim v As Variant
    For Each v In Array(1, 6, 13, 128)
        Debug.Print v, ReverseByte(CLng(v)) ' 128 96 176 1
    Next v
End Sub
