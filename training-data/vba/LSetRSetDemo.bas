Sub Main()
    Dim field As String
    Dim label As String

    field = String(10, ".")
    LSet field = "left"
    Debug.Print "[" & field & "]"      ' [left      ]

    field = String(10, ".")
    RSet field = "right"
    Debug.Print "[" & field & "]"      ' [     right]

    ' Text longer than the target is truncated
    field = String(4, ".")
    LSet field = "truncated"
    Debug.Print "[" & field & "]"      ' [trun]

    ' Fixed-width report line
    label = Space(8)
    RSet label = CStr(42)
    Debug.Print "Total:" & label       ' Total:      42
End Sub
