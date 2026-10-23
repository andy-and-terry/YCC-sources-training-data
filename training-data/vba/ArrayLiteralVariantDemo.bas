Attribute VB_Name = "ArrayLiteralVariantDemo"
Option Explicit

' Array() builds a zero-based Variant array from a list of values
Public Sub ArrayLiteral()
    Dim fruits As Variant
    Dim mixed As Variant
    Dim i As Long

    fruits = Array("apple", "banana", "cherry")
    For i = LBound(fruits) To UBound(fruits)
        Debug.Print i & ": " & fruits(i)
    Next i

    mixed = Array(1, "two", 3.5, True)
    For i = 0 To UBound(mixed)
        Debug.Print TypeName(mixed(i)) & " -> " & mixed(i)
    Next i

    Debug.Print "IsArray: " & IsArray(fruits)
    Debug.Print "count: " & (UBound(fruits) - LBound(fruits) + 1)
End Sub
