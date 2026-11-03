Attribute VB_Name = "SwapCaseManual"
Option Explicit

Public Function SwapCase(ByVal s As String) As String
    Dim i As Long, c As String, out As String
    For i = 1 To Len(s)
        c = Mid$(s, i, 1)
        If c Like "[A-Z]" Then
            out = out & LCase$(c)
        Else
            out = out & UCase$(c)
        End If
    Next i
    SwapCase = out
End Function

Public Sub Demo()
    Debug.Print SwapCase("Hello World 42")
End Sub
