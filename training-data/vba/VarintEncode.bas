Function Varint(ByVal n As Long) As String
    Dim out As String
    Do While n >= 128
        out = out & Right$("0" & Hex$((n Mod 128) Or 128), 2) & " "
        n = n \ 128
    Loop
    Varint = out & Right$("0" & Hex$(n), 2)
End Function
