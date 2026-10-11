Function RandomBetween(ByVal lo As Long, ByVal hi As Long) As Long
    RandomBetween = Int((hi - lo + 1) * Rnd + lo)
End Function

Sub Shuffle(arr() As Long)
    Dim i As Long, j As Long, t As Long
    For i = UBound(arr) To LBound(arr) + 1 Step -1
        j = RandomBetween(LBound(arr), i)
        t = arr(i): arr(i) = arr(j): arr(j) = t
    Next i
End Sub

Sub Main()
    Rnd -1
    Randomize 42
    Dim deck(9) As Long, i As Long, line As String
    For i = 0 To 9: deck(i) = i + 1: Next i
    Shuffle deck
    For i = 0 To 9: line = line & deck(i) & " ": Next i
    Debug.Print line
    Debug.Print "Dice: " & RandomBetween(1, 6)
End Sub
