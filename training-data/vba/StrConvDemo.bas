Option Explicit

Sub Main()
    Dim s As String
    s = "hello wORLD from vba"

    Debug.Print StrConv(s, vbUpperCase)
    Debug.Print StrConv(s, vbLowerCase)
    Debug.Print StrConv(s, vbProperCase)

    ' Convert a string to a byte array and back
    Dim bytes() As Byte
    bytes = StrConv("ABC", vbFromUnicode)
    Dim i As Long
    For i = LBound(bytes) To UBound(bytes)
        Debug.Print "byte " & i & ": " & bytes(i)
    Next i

    Dim back As String
    back = StrConv(bytes, vbUnicode)
    Debug.Print "Back to string: " & back

    ' Combine conversions with addition
    Debug.Print StrConv("MIXED case", vbProperCase + vbLowerCase)
End Sub
