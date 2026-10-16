Function NextValue(ByVal n As Long) As Long
    Dim total As Long, d As Long
    Do While n > 0
        d = n Mod 10
        total = total + d * d
        n = n \ 10
    Loop
    NextValue = total
End Function

Function IsHappy(ByVal n As Long) As Boolean
    Dim slow As Long, fast As Long
    slow = n: fast = NextValue(n)
    Do While fast <> 1 And slow <> fast
        slow = NextValue(slow)
        fast = NextValue(NextValue(fast))
    Loop
    IsHappy = (fast = 1)
End Function

Sub Main()
    Dim n As Long, line As String
    For n = 1 To 50
        If IsHappy(n) Then line = line & n & " "
    Next n
    Debug.Print line
End Sub
