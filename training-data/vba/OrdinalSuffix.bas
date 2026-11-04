Attribute VB_Name = "OrdinalSuffix"
Option Explicit

Public Function Ordinal(ByVal n As Long) As String
    Dim r100 As Long, suffix As String
    r100 = n Mod 100
    If r100 >= 11 And r100 <= 13 Then
        suffix = "th"
    Else
        Select Case n Mod 10
            Case 1: suffix = "st"
            Case 2: suffix = "nd"
            Case 3: suffix = "rd"
            Case Else: suffix = "th"
        End Select
    End If
    Ordinal = n & suffix
End Function

Public Sub DemoOrdinal()
    Dim v As Variant, s As String
    For Each v In Array(1, 2, 3, 4, 11, 12, 13, 21, 101, 111)
        s = s & Ordinal(CLng(v)) & " "
    Next v
    Debug.Print s
End Sub
