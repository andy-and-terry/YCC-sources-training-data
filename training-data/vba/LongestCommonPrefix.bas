Function CommonPrefix(words As Variant) As String
    Dim prefix As String, i As Long
    If UBound(words) < LBound(words) Then Exit Function
    prefix = words(LBound(words))
    For i = LBound(words) + 1 To UBound(words)
        Do While Left$(words(i), Len(prefix)) <> prefix
            prefix = Left$(prefix, Len(prefix) - 1)
            If Len(prefix) = 0 Then CommonPrefix = "": Exit Function
        Loop
    Next i
    CommonPrefix = prefix
End Function

Sub Main()
    Debug.Print "[" & CommonPrefix(Array("flower", "flow", "flight")) & "]"
    Debug.Print "[" & CommonPrefix(Array("dog", "racecar")) & "]"
    Debug.Print "[" & CommonPrefix(Array("interview", "internet", "interval")) & "]"
End Sub
