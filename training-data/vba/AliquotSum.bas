' Aliquot sum classification.
Public Function Aliquot(n As Long) As Long
    Dim d As Long
    For d = 1 To n - 1
        If n Mod d = 0 Then Aliquot = Aliquot + d
    Next d
End Function

Public Function Classify(n As Long) As String
    Dim a As Long: a = Aliquot(n)
    Select Case True
        Case a = n: Classify = "perfect"
        Case a > n: Classify = "abundant"
        Case Else: Classify = "deficient"
    End Select
End Function
