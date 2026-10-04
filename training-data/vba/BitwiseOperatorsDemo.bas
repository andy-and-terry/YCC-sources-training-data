Function IsBitSet(ByVal value As Long, ByVal bit As Long) As Boolean
    IsBitSet = (value And (2 ^ bit)) <> 0
End Function

Function CountBits(ByVal n As Long) As Long
    Dim c As Long
    Do While n > 0
        c = c + (n And 1)
        n = n \ 2
    Loop
    CountBits = c
End Function

Sub Main()
    Debug.Print 12 And 10
    Debug.Print 12 Or 10
    Debug.Print 12 Xor 10
    Debug.Print Not 0
    Debug.Print IsBitSet(5, 0) & " " & IsBitSet(5, 1) & " " & IsBitSet(5, 2)
    Debug.Print CountBits(255)
    Debug.Print Hex(255) & " " & Oct(8)
    Debug.Print &HFF & " " & &O17
End Sub
