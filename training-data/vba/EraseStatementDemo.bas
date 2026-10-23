Sub Main()
    Dim fixedArr(1 To 3) As Long
    Dim dynArr() As Long
    Dim i As Long

    For i = 1 To 3
        fixedArr(i) = i * 10
    Next i

    ReDim dynArr(0 To 2)
    dynArr(0) = 7: dynArr(1) = 8: dynArr(2) = 9

    ' Erase resets a fixed array to defaults but keeps its size.
    Erase fixedArr
    Debug.Print "fixed after Erase: "; fixedArr(1); fixedArr(2); fixedArr(3)

    ' Erase frees a dynamic array entirely.
    Erase dynArr
    On Error Resume Next
    Debug.Print UBound(dynArr)
    If Err.Number <> 0 Then Debug.Print "dynamic array is deallocated: error "; Err.Number
    On Error GoTo 0

    ReDim dynArr(0 To 1)
    Debug.Print "reallocated upper bound: "; UBound(dynArr)
End Sub
