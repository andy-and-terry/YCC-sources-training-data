' Circular primes below 100; expect 13.
Option Explicit

Private Function IsPrime(ByVal n As Long) As Boolean
    Dim d As Long
    If n < 2 Then Exit Function
    IsPrime = True
    d = 2
    Do While d * d <= n
        If n Mod d = 0 Then IsPrime = False: Exit Function
        d = d + 1
    Loop
End Function

Private Function Circular(ByVal n As Long) As Boolean
    Dim s As String, i As Long
    s = CStr(n)
    Circular = True
    For i = 0 To Len(s) - 1
        If Not IsPrime(CLng(Mid$(s, i + 1) & Left$(s, i))) Then Circular = False
    Next i
End Function

Public Sub Main()
    Dim c As Long, p As Long, n As Long
    For n = 2 To 99
        If Circular(n) Then c = c + 1
    Next n
    Debug.Print c
End Sub
