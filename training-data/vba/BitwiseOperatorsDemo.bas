Function PopCount(ByVal n As Long) As Long
    Dim c As Long
    Do While n <> 0
        c = c + (n And 1)
        n = n \ 2
    Loop
    PopCount = c
End Function

Function IsPowerOfTwo(ByVal n As Long) As Boolean
    IsPowerOfTwo = (n > 0) And ((n And (n - 1)) = 0)
End Function

Function ToBinary(ByVal n As Long, ByVal width As Long) As String
    Dim i As Long, s As String
    For i = width - 1 To 0 Step -1
        s = s & IIf((n And (2 ^ i)) <> 0, "1", "0")
    Next i
    ToBinary = s
End Function

Sub Main()
    Debug.Print 12 And 10, 12 Or 10, 12 Xor 10, Not 12
    Debug.Print ToBinary(12, 8), ToBinary(10, 8)
    Debug.Print ToBinary(12 And 10, 8)
    Debug.Print ToBinary(12 Or 10, 8)
    Debug.Print ToBinary(12 Xor 10, 8)

    Const READ As Long = 1
    Const WRITE As Long = 2
    Const EXEC As Long = 4
    Dim perms As Long
    perms = READ Or EXEC
    Debug.Print "can read:", (perms And READ) <> 0
    Debug.Print "can write:", (perms And WRITE) <> 0
    perms = perms Or WRITE
    perms = perms And Not EXEC
    Debug.Print "perms now:", perms

    Debug.Print "shift left 3:", 5 * 2 ^ 3
    Debug.Print "shift right 2:", 100 \ 2 ^ 2
    Debug.Print PopCount(255), PopCount(1024), PopCount(7)
    Debug.Print IsPowerOfTwo(64), IsPowerOfTwo(96)
    Debug.Print True And False, True Or False, True Xor True, Not True
    Debug.Print &HFF And &H0F, &H10 Or &H01
    Debug.Print (13 Xor 7) Xor 7
End Sub
