Sub Main()
    Dim s As String
    s = "hello wORLD"

    Debug.Print StrConv(s, vbUpperCase)   ' HELLO WORLD
    Debug.Print StrConv(s, vbLowerCase)   ' hello world
    Debug.Print StrConv(s, vbProperCase)  ' Hello World

    Debug.Print StrReverse("stressed")    ' desserts

    Dim bytes() As Byte
    bytes = StrConv("ABC", vbFromUnicode)
    Dim i As Long
    For i = LBound(bytes) To UBound(bytes)
        Debug.Print "byte " & i & " = " & bytes(i)
    Next i

    Debug.Print StrConv(bytes, vbUnicode) ' ABC
End Sub
