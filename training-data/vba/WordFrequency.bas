Sub WordFrequency(text As String)
    Dim words() As String
    Dim freq As Object
    Set freq = CreateObject("Scripting.Dictionary")
    words = Split(LCase(text), " ")
    Dim i As Long
    For i = LBound(words) To UBound(words)
        If freq.Exists(words(i)) Then
            freq(words(i)) = freq(words(i)) + 1
        Else
            freq.Add words(i), 1
        End If
    Next i
    Dim key As Variant
    For Each key In freq.Keys
        Debug.Print key, freq(key)
    Next key
End Sub

Sub Main()
    WordFrequency "the quick brown fox the lazy fox"
End Sub
