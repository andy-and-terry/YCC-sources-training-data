Private moves As Collection

Sub Hanoi(n As Long, a As String, b As String, c As String)
    If n = 0 Then Exit Sub
    Hanoi n - 1, a, c, b
    moves.Add a & "->" & c
    Hanoi n - 1, b, a, c
End Sub

Sub RunHanoi()
    Set moves = New Collection
    Hanoi 3, "A", "B", "C"
    Debug.Print moves.Count & " moves"
End Sub
