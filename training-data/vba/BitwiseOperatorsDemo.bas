Function PopCount(ByVal n As Long) As Long
    Dim c As Long
    Do While n <> 0
        n = n And (n - 1)
        c = c + 1
    Loop
    PopCount = c
End Function

Sub Main()
    Debug.Print 12 And 10
    Debug.Print 12 Or 10
    Debug.Print 12 Xor 10
    Debug.Print Not 0
    Debug.Print PopCount(255)

    ' VBA has no shift operators; use multiplication and integer division.
    Debug.Print 1 * 2 ^ 10
    Debug.Print 1024 \ 2 ^ 3

    Dim flags As Long
    flags = flags Or 4
    flags = flags Or 1
    Debug.Print flags, (flags And 4) <> 0, (flags And 2) <> 0
    flags = flags And Not 4
    Debug.Print flags
    Debug.Print Hex(255), Oct(8)
End Sub
