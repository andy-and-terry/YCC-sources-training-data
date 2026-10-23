Sub Main()
    Dim lucky(0 To 49) As Long
    Dim length As Long, idx As Long, stepSize As Long, kept As Long
    Dim i As Long, k As Long, result As String
    For i = 0 To 49
        lucky(i) = 2 * i + 1
    Next i
    length = 50
    idx = 1
    Do While idx < length
        If lucky(idx) > length Then Exit Do
        stepSize = lucky(idx)
        kept = 0
        For k = 0 To length - 1
            If (k + 1) Mod stepSize <> 0 Then
                lucky(kept) = lucky(k)
                kept = kept + 1
            End If
        Next k
        length = kept
        idx = idx + 1
    Loop
    result = CStr(lucky(0))
    For i = 1 To length - 1
        result = result & " " & lucky(i)
    Next i
    Debug.Print result
End Sub
