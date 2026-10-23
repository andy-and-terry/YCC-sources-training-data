Sub Main()
    Dim a As Boolean, b As Boolean

    Debug.Print "A", "B", "Eqv", "Imp", "Xor"
    For Each a In Array(False, True)
        For Each b In Array(False, True)
            Debug.Print a, b, (a Eqv b), (a Imp b), (a Xor b)
        Next b
    Next a

    ' Bitwise on integers: Eqv is NOT XOR, Imp is (NOT a) OR b.
    Dim x As Long, y As Long
    x = &HF0
    y = &HFF
    Debug.Print Hex$(x Eqv y)
    Debug.Print Hex$(x Imp y)
    Debug.Print Hex$(x And y), Hex$(x Or y), Hex$(x Xor y)
End Sub
