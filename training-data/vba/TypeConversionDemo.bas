Sub Main()
    Debug.Print CInt(3.7)
    Debug.Print CInt(2.5)
    Debug.Print Int(-3.2)
    Debug.Print Fix(-3.2)
    Debug.Print CLng("12345")
    Debug.Print CDbl("3.14") * 2
    Debug.Print CStr(42) & "!"
    Debug.Print CBool(0) & " " & CBool(5)
    Debug.Print Val("12abc")
    Debug.Print IsNumeric("1e3") & " " & IsNumeric("abc")
    Debug.Print TypeName(5) & " " & TypeName(5#) & " " & TypeName("x")
    Debug.Print TypeName(Null) & " " & TypeName(Empty)
    Debug.Print 7 \ 2 & " " & 7 Mod 2 & " " & 7 / 2
    Debug.Print Round(2.567, 2)
End Sub
