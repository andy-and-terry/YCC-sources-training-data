' Reverse-and-add until a palindrome; count the steps.
Function ReverseDigits(ByVal n As Double) As Double
    ReverseDigits = CDbl(StrReverse(Format(n, "0")))
End Function

Function Steps(ByVal n As Double) As Long
    Dim count As Long
    For count = 0 To 49
        If count > 0 And n = ReverseDigits(n) Then
            Steps = count
            Exit Function
        End If
        n = n + ReverseDigits(n)
    Next count
    Steps = -1
End Function

Sub PrintLychrel()
    Dim starts As Variant, v As Variant, out As String
    starts = Array(56, 57, 59, 79, 89)
    For Each v In starts
        out = out & Steps(CDbl(v)) & " "
    Next v
    Debug.Print Trim(out)
End Sub
