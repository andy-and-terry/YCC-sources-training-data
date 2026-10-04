Function FirstNegative(values As Variant) As Variant
    Dim i As Long
    FirstNegative = Empty
    For i = LBound(values) To UBound(values)
        If values(i) < 0 Then
            FirstNegative = values(i)
            Exit Function
        End If
    Next i
End Function

Sub PrintUntilBlank(items As Variant)
    Dim i As Long
    For i = LBound(items) To UBound(items)
        If Len(items(i)) = 0 Then Exit Sub
        Debug.Print "item:", items(i)
    Next i
    Debug.Print "no blank found"
End Sub

Function IsPrime(ByVal n As Long) As Boolean
    Dim i As Long
    If n < 2 Then Exit Function
    IsPrime = True
    For i = 2 To CLng(Sqr(n))
        If n Mod i = 0 Then
            IsPrime = False
            Exit For
        End If
    Next i
End Function

Sub Main()
    Debug.Print FirstNegative(Array(4, 8, -3, 9, -1))
    Debug.Print IsEmpty(FirstNegative(Array(1, 2, 3)))

    PrintUntilBlank Array("a", "b", "", "c")
    PrintUntilBlank Array("x", "y")

    Dim n As Long
    For n = 1 To 20
        If IsPrime(n) Then Debug.Print n;
    Next n
    Debug.Print

    Dim r As Long, c As Long, found As Boolean
    For r = 1 To 5
        For c = 1 To 5
            If r * c = 12 Then
                found = True
                Exit For
            End If
        Next c
        If found Then Exit For
    Next r
    Debug.Print "first product of 12 at", r, c

    Dim k As Long
    Do
        k = k + 7
        If k Mod 5 = 0 Then Exit Do
    Loop
    Debug.Print "first multiple of 7 and 5:", k
End Sub
