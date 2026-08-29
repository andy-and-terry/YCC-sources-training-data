Function IsValid(s As String) As Boolean
    Dim stack As String
    Dim i As Long, c As String
    stack = ""
    For i = 1 To Len(s)
        c = Mid(s, i, 1)
        If c = "(" Or c = "[" Or c = "{" Then
            stack = stack & c
        ElseIf c = ")" Or c = "]" Or c = "}" Then
            If Len(stack) = 0 Then
                IsValid = False
                Exit Function
            End If
            Dim top As String
            top = Right(stack, 1)
            If (c = ")" And top <> "(") Or (c = "]" And top <> "[") Or (c = "}" And top <> "{") Then
                IsValid = False
                Exit Function
            End If
            stack = Left(stack, Len(stack) - 1)
        End If
    Next i
    IsValid = (Len(stack) = 0)
End Function

Sub Main()
    Debug.Print IsValid("{[()]}")
    Debug.Print IsValid("{[(])}")
End Sub
