Attribute VB_Name = "EarlyExitFunctionLoopDemo"
Option Explicit

Private Function FirstNegativeIndex(values As Variant) As Long
    Dim i As Long
    FirstNegativeIndex = -1
    For i = LBound(values) To UBound(values)
        If values(i) < 0 Then
            FirstNegativeIndex = i
            Exit Function
        End If
    Next i
End Function

Public Sub EarlyExit()
    Dim i As Long

    For i = 1 To 100
        If i * i > 50 Then Exit For
    Next i
    Debug.Print "first i with i*i > 50: " & i

    Debug.Print "negative at: " & FirstNegativeIndex(Array(3, 8, -2, 5))
    Debug.Print "negative at: " & FirstNegativeIndex(Array(1, 2))
End Sub
