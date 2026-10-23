Option Explicit
Option Compare Text

' With Option Compare Text, string comparisons ignore case.
Function SameName(ByVal a As String, ByVal b As String) As Boolean
    SameName = (a = b)
End Function

Function CountMatches(items As Variant, ByVal target As String) As Long
    Dim i As Long
    For i = LBound(items) To UBound(items)
        If items(i) = target Then CountMatches = CountMatches + 1
    Next i
End Function

Sub Main()
    Debug.Print "apple = APPLE: " & SameName("apple", "APPLE")
    Debug.Print "Apple < banana: " & ("Apple" < "banana")

    Dim fruits As Variant
    fruits = Array("Apple", "apple", "APPLE", "Pear")
    Debug.Print "Matches for 'apple': " & CountMatches(fruits, "apple")

    ' Like also follows the module's compare mode
    Debug.Print "'Hello' Like 'h*': " & ("Hello" Like "h*")

    ' InStr can override explicitly with vbBinaryCompare
    Debug.Print "InStr text:   " & InStr(1, "Hello World", "WORLD", vbTextCompare)
    Debug.Print "InStr binary: " & InStr(1, "Hello World", "WORLD", vbBinaryCompare)
End Sub
