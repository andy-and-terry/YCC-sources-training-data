Sub Main()
    Debug.Print CInt("42") + 1
    Debug.Print CDbl("3.5") * 2
    Debug.Print CLng(2.5); CLng(3.5); CLng(-2.5)
    Debug.Print Int(-2.5); Fix(-2.5)
    Debug.Print CStr(123) & "abc"
    Debug.Print CBool(0); CBool(5)
    Debug.Print Val("12abc"); Val("abc"); Val("3.14xyz")
    Debug.Print IsNumeric("12.5"); IsNumeric("12a"); IsNumeric("")

    Dim v As Variant
    v = "100"
    Debug.Print TypeName(v); VarType(v)
    v = CLng(v)
    Debug.Print TypeName(v)
    v = v / 8
    Debug.Print v; TypeName(v)

    Dim b As Byte
    On Error Resume Next
    b = 300
    If Err.Number <> 0 Then Debug.Print "overflow: "; Err.Description
End Sub
