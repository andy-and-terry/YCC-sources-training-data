Sub Hanoi(n As Long, fromPeg As String, toPeg As String, viaPeg As String)
    If n = 0 Then Exit Sub
    Hanoi n - 1, fromPeg, viaPeg, toPeg
    Debug.Print "Move disk " & n & " from " & fromPeg & " to " & toPeg
    Hanoi n - 1, viaPeg, toPeg, fromPeg
End Sub

Sub Main()
    Hanoi 3, "A", "C", "B"
End Sub
