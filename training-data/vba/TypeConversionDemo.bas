Sub Main()
    Debug.Print CInt(3.5), CInt(2.5), CInt(-2.5)
    Debug.Print Int(3.9), Int(-3.1), Fix(3.9), Fix(-3.9)
    Debug.Print CLng("1234") + 1
    Debug.Print CDbl("3.14") * 2
    Debug.Print CStr(42) & "!"
    Debug.Print CBool(0), CBool(-1), CBool("True")
    Debug.Print CDate("2024-06-15") + 1
    Debug.Print CByte(200), CSng(1 / 3)
    Debug.Print Val("42abc"), Val("abc"), Val("3.5e2")
    Debug.Print Val("&HFF"), Hex$(255), Oct$(8)

    Debug.Print TypeName(5), TypeName(5&), TypeName(5!), TypeName(5#)
    Debug.Print TypeName("x"), TypeName(True), TypeName(Null), TypeName(Empty)
    Debug.Print TypeName(Array(1, 2)), TypeName(Nothing)

    Dim v As Variant
    v = "123"
    Debug.Print IsNumeric(v), VarType(v) = vbString
    v = CLng(v)
    Debug.Print IsNumeric(v), VarType(v) = vbLong
    Debug.Print IsNumeric("1,234"), IsNumeric("1e3"), IsNumeric("")
    Debug.Print "5" + "5", "5" & "5", 5 + "5"

    On Error Resume Next
    Dim x As Long
    x = CLng("not a number")
    Debug.Print "Conversion error:", Err.Number
    Err.Clear
    x = CLng(3000000000#)
    Debug.Print "Overflow error:", Err.Number
End Sub
