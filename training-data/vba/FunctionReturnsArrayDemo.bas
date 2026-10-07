Function Squares(ByVal n As Long) As Long()
    Dim result() As Long
    Dim i As Long
    ReDim result(1 To n)
    For i = 1 To n
        result(i) = i * i
    Next i
    Squares = result
End Function

Function SplitWords(ByVal text As String) As Variant
    SplitWords = Split(Trim(text), " ")
End Function

Function MinMax(values As Variant) As Variant
    Dim lo As Variant, hi As Variant, v As Variant
    lo = values(LBound(values))
    hi = lo
    For Each v In values
        If v < lo Then lo = v
        If v > hi Then hi = v
    Next v
    MinMax = Array(lo, hi)
End Function

Sub Main()
    Dim sq() As Long
    Dim i As Long
    sq = Squares(5)
    For i = LBound(sq) To UBound(sq)
        Debug.Print sq(i);
    Next i
    Debug.Print

    Dim w As Variant
    w = SplitWords("  alpha beta gamma ")
    Debug.Print UBound(w) + 1; w(1)

    Dim mm As Variant
    mm = MinMax(Array(7, 2, 9, -1, 4))
    Debug.Print "min="; mm(0); " max="; mm(1)
End Sub
