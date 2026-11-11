' Population count (number of set bits) for 0..15
Function Bits(ByVal n As Long) As Long
    Do While n > 0
        Bits = Bits + (n And 1)
        n = n \ 2
    Loop
End Function

Sub Main()
    Dim n As Long, out As String
    For n = 0 To 15
        out = out & Bits(n) & " "
    Next n
    Debug.Print out
End Sub
