Attribute VB_Name = "BaseNConvert"
Option Explicit

Public Function ToBase(ByVal n As Long, ByVal base As Long) As String
    Const DIGITS As String = "0123456789abcdefghijklmnopqrstuvwxyz"
    If n = 0 Then ToBase = "0": Exit Function
    Do While n > 0
        ToBase = Mid$(DIGITS, (n Mod base) + 1, 1) & ToBase
        n = n \ base
    Loop
End Function

Public Sub DemoBaseN()
    Dim b As Variant
    For Each b In Array(2, 8, 16, 36)
        Debug.Print "255 in base " & b & " = " & ToBase(255, CLng(b))
    Next b
    Debug.Print Hex$(255), Oct$(255)
End Sub
