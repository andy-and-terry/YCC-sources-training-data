Attribute VB_Name = "WordWrapGreedy"
Option Explicit

Public Function WrapText(ByVal text As String, ByVal width As Long) As Collection
    Dim words() As String, w As Variant, line As String
    Set WrapText = New Collection
    words = Split(text, " ")
    For Each w In words
        If Len(line) > 0 And Len(line) + 1 + Len(w) > width Then
            WrapText.Add line
            line = w
        ElseIf Len(line) = 0 Then
            line = w
        Else
            line = line & " " & w
        End If
    Next w
    If Len(line) > 0 Then WrapText.Add line
End Function

Public Sub DemoWrap()
    Dim l As Variant
    For Each l In WrapText("the quick brown fox jumps over the lazy dog", 15)
        Debug.Print "|" & l & Space$(15 - Len(l)) & "|"
    Next l
End Sub
