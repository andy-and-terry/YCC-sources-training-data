Sub DateTimeMath()
    Dim d As Date: d = DateSerial(2024, 2, 28)
    Debug.Print Format(d, "yyyy-mm-dd"), Weekday(d, vbMonday), Format(d, "dddd"), DatePart("y", d)
    Debug.Print Format(DateAdd("d", 2, d), "yyyy-mm-dd"), Format(DateAdd("m", 1, d), "yyyy-mm-dd"), DateDiff("d", d, DateSerial(2024, 12, 25))
    Debug.Print Year(d), Month(d), Day(d), Hour(TimeSerial(13, 45, 10)), Minute(#1:45:10 PM#)
    Debug.Print IsDate("2024-13-45"), IsDate("2024-02-29"), CDate("2024-03-05") > d
    Debug.Print Sqr(144), Abs(-5), Int(-2.5), Fix(-2.5), Round(2.5), Round(3.5), Sgn(-3)
    Debug.Print 7 \ 2, 7 Mod 3, 2 ^ 10, -7 \ 2, -7 Mod 3, 7 / 2
    Debug.Print Exp(1), Log(Exp(2)), Atn(1) * 4, Sin(0), Hex(255), Oct(8), &HFF, &O17
    Randomize 1: Debug.Print Int(Rnd * 6) + 1 >= 1
    Debug.Print TypeName(1), TypeName(1#), TypeName("s"), TypeName(Nothing), TypeName(d), VarType(1)
    Debug.Print CLng(2.5), CInt(3.5), CDbl("1.5") + 1, CBool(0), CStr(True), CCur(1.23456)
End Sub
